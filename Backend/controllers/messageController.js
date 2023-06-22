const Message = require("../models/messageModel");
const CustomError = require("../helpers/error/CustomError");
const asyncErrorWrapper = require("express-async-handler");
const Conversation = require("../models/conversationModel");
const Group = require("../models/groupModel");
const User = require("../models/userModel");
const crypto = require("crypto");


const createMessage = asyncErrorWrapper(async (req, res) => {
    const { content, sender, receiver, groupId } = req.body;

    const encryptionKey = crypto.randomBytes(32); // Rastgele bir şifreleme anahtarı oluşturun

    // İletiyi şifrele
    const iv = crypto.randomBytes(16); // Rastgele bir iv (Initialization Vector) oluşturun
    const cipher = crypto.createCipheriv('aes-256-cbc', encryptionKey, iv);
    let encryptedContent = cipher.update(content, 'utf8', 'hex');
    encryptedContent += cipher.final('hex');

    let message;

    if (groupId || receiver) {
        message = await Message.create({
            content: encryptedContent,
            sender,
            receiver,
            groupId,
            encryptionKey: encryptionKey.toString('hex'),               // Şifreleme anahtarını hexadecimal formatına dönüştürerek kaydet
            iv: iv.toString('hex'),                                     // Initialization Vector'ü hexadecimal formatına dönüştürerek kaydet
        });

        if (groupId) {
            let conversation = await Conversation.findOne({ groupId });

            if (!conversation) {
                conversation = new Conversation({
                    participants: [],
                    messages: [],
                    groupId,
                });
            }

            conversation.messages.push(message._id);

            await Promise.all([message.save(), conversation.save()]);
        }
    } else {
        return res.status(400).json({
            success: false,
            message: 'Please provide either groupId or receiver for the message',
        });
    }

    res.status(201).json({
        success: true,
        message,
    });
});

const decryptMessage = asyncErrorWrapper(async (req, res) => {
    const { messageId, decryptionKey } = req.body;

    // İleti bilgisini veritabanından al
    const message = await Message.findById(messageId);

    if (!message) {
        return res.status(404).json({
            success: false,
            message: 'Message not found',
        });
    }

    if (!message.iv) {
        return res.status(400).json({
            success: false,
            message: 'Initialization Vector (IV) not found in the message',
        });
    }

    const decipher = crypto.createDecipheriv(
        'aes-256-cbc',
        Buffer.from(decryptionKey, 'hex'),
        Buffer.from(message.iv, 'hex')
    );

    let decryptedContent = decipher.update(message.content, 'hex', 'utf8');
    decryptedContent += decipher.final('utf8');

    res.status(200).json({
        success: true,
        decryptedContent,
    });
});




const getAllMessages = asyncErrorWrapper(async (req, res) => {
    const messages = await Message.find();

    res.status(200).json({
        success: true,
        messages,
    });
});

const getSingleMessage = asyncErrorWrapper(async (req, res) => {
    const message = await Message.findById(req.params.id);

    if (!message) {
        return res.status(404).json({
            success: false,
            message: "Message not found",
        });
    }

    res.status(200).json({
        success: true,
        message,
    });
});

const updateMessage = asyncErrorWrapper(async (req, res) => {
    const message = await Message.findByIdAndUpdate(req.params.id, req.body, {
        new: true,
        runValidators: true,
    });

    if (!message) {
        return res.status(404).json({
            success: false,
            message: "Message not found",
        });
    }

    res.status(200).json({
        success: true,
        message,
    });
});

const deleteMessage = asyncErrorWrapper(async (req, res) => {
    const message = await Message.findByIdAndDelete(req.params.id);

    if (!message) {
        return res.status(404).json({
            success: false,
            message: "Message not found",
        });
    }

    res.status(200).json({
        success: true,
        message: "Message deleted",
    });
});


module.exports = {
    createMessage,
    getAllMessages,
    getSingleMessage,
    updateMessage,
    deleteMessage,
    decryptMessage,
};
