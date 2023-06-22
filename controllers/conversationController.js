const Conversation = require("../models/conversationModel");
const CustomError = require("../helpers/error/CustomError");
const asyncErrorWrapper = require("express-async-handler");
const User = require("../models/userModel");
const Message = require("../models/messageModel");
const Group = require("../models/groupModel");


const createConversation = asyncErrorWrapper(async (req, res) => {
    const { participants } = req.body;

    const conversation = await Conversation.create({ participants });

    // Güncelleme işlemi için kullanıcıların kimlik bilgilerini içeren bir dizi oluşturun
    const userUpdates = participants.map((participant) => ({
        updateOne: {
            filter: { _id: participant },
            update: { $push: { conversations: conversation._id } },
        },
    }));

    // Kullanıcıları güncelleyin
    await User.bulkWrite(userUpdates);

    res.status(201).json({
        success: true,
        conversation,
    });
});


const getAllConversations = asyncErrorWrapper(async (req, res) => {
    const conversations = await Conversation.find().populate("participants", "name");

    res.status(200).json({
        success: true,
        conversations,
    });
});

const getSingleConversation = asyncErrorWrapper(async (req, res) => {
    const { id } = req.params;

    const conversation = await Conversation.findById(id).populate("participants", "name");

    if (!conversation) {
        return res.status(404).json({
            success: false,
            message: "Conversation not found",
        });
    }

    res.status(200).json({
        success: true,
        conversation,
    });
});





module.exports = {
    createConversation,
    getAllConversations,
    getSingleConversation,
};
