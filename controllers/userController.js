const User = require("../models/userModel");
const Group = require("../models/groupModel");
const CustomError = require("../helpers/error/CustomError");
const asyncErrorWrapper = require("express-async-handler");
const { sendJwtToClient } = require("../helpers/authorization/tokenHelpers");
const nodemailer = require("nodemailer");

const transporter = nodemailer.createTransport({
    // E-posta gönderme ayarlarını buraya ekleyin
    service: "Gmail",
    auth: {
        user: "musakolcuk@gmail.com",
        pass: "yjuvgkgcmlahahhi",
    },
});

const createUser = asyncErrorWrapper(async (req, res, next) => {
    const { name, email, password, role, groupId } = req.body;

    const verificationCode = generateVerificationCode();

    const user = await User.create({
        name,
        email,
        password,
        role,
        groupId,
        verificationCode,
        isVerified: false,
        profile_image: "",
    });

    // E-posta gönderme işlemi
    const mailOptions = {
        from: "musakolcuk@gmail.com",
        to: email,
        subject: "Account Verification",
        text: `Your verification code is: ${verificationCode}`,
    };

    // E-postayı göndermek için Nodemailer kullanımı örneği:
    transporter.sendMail(mailOptions, (error, info) => {
        if (error) {
            console.log(error);
            return;
        }
        console.log("Verification code sent:", info.response);
    });

    sendJwtToClient(user, res);
});

function generateVerificationCode() {
    // Rastgele bir doğrulama kodu oluşturun
    const verificationCode = Math.floor(100000 + Math.random() * 900000);
    return verificationCode.toString();
}

const verifyAccount = asyncErrorWrapper(async (req, res, next) => {
    const { verificationCode } = req.body;

    const user = await User.findOne({ verificationCode });

    if (!user) {
        return res.status(400).json({
            success: false,
            message: "Invalid verification code",
        });
    }

    // Kodun süresini kontrol et
    if (user.verificationCodeExpire && user.verificationCodeExpire < Date.now()) {
        return res.status(400).json({
            success: false,
            message: "Verification code has expired",
        });
    }

    // Kullanıcının hesabını doğrulayın
    user.isVerified = true;
    user.verificationCode = ""; // Kodu sıfırla veya null yapabilirsiniz
    await user.save();

    res.status(200).json({
        success: true,
        message: "Account verified",
    });
});







const deleteUser = asyncErrorWrapper(async (req, res, next) => {

    const { id } = req.params;
    const user = await User.findByIdAndDelete(id);


    return res.status(200).json({
        success: true,
        message: "Delete Operation Successful"
    });
});


const updateUser = asyncErrorWrapper(async (req, res, next) => {

    const { id } = req.params;
    const { name } = req.body;

    let user = await User.findById(id);

    user.name = name;


    await user.save();

    return res.status(200).json({
        success: true,
        message: "Update Operation Successful"
    });
});



const getSingleUser = asyncErrorWrapper(async (req, res, next) => {

    const { id } = req.params;                                                                //id bilgisi url'den alinir.
    const user = await User.findById(id);                                                   //id bilgisi ile kullanici bilgileri alinir.

    return res.status(200)
        .json({
            success: true,
            data: user
        });
});

const getAllUsers = asyncErrorWrapper(async (req, res, next) => {
    const users = await User.find();                                                        //tum kullanici bilgileri alinir.

    return res.status(200)
        .json({
            success: true,
            data: users
        });
});



// Kullanıcının gruplarını getirme
const getUserGroups = asyncErrorWrapper(async (req, res, next) => {
    const { id } = req.params;

    const user = await User.findById(id).populate({
        path: "groups",
        select: "name",
    });

    return res.status(200).json({
        success: true,
        dataCount: user.groups.length,
        data: user.groups,
    });
});


const deleteAllUsers = asyncErrorWrapper(async (req, res, next) => {
    await User.deleteMany({});

    return res.status(200).json({
        success: true,
        message: "All users have been deleted.",
    });
});



// Kullanıcıyı rehbere ekleme
const addToContacts = asyncErrorWrapper(async (req, res) => {
    const { userId, contactId } = req.params;

    // İlgili kullanıcıları bulma
    const user = await User.findById(userId);
    const contact = await User.findById(contactId);

    // Rehberdeki kullanıcılara ekleme
    user.contacts.push(contactId);
    contact.contacts.push(userId);

    // Değişiklikleri kaydetme
    await user.save();
    await contact.save();

    return res.status(200).json({
        success: true,
        message: 'Kullanıcı rehbere başarıyla eklendi.',
    });
});



// Kullanıcının rehberini getirme
const getContacts = asyncErrorWrapper(async (req, res, next) => {
    const { id } = req.params;

    const user = await User.findById(id).populate({
        path: "contacts",
        select: "name email",
    });

    return res.status(200).json({
        success: true,
        dataCount: user.contacts.length,
        data: user.contacts,
    });
});


const imageUpload = asyncErrorWrapper(async (req, res, next) => {

    const user = await User.findByIdAndUpdate(req.user.id, {           //kullanici id'si ile kullanici bilgileri guncellenir.
    "profile_image": req.savedProfileImage
}, {
    new: true,
    runValidators: true                                                 //guncelleme isleminde validasyonlari calistirir.
});

res.status(200).json({
    success: true,
    message: "Image Upload Successfull",
    data: user,                                                         //guncellenmis kullanici bilgileri dondurulur.
})
});



// Kullanıcının gruplarını getirme
// const getUserGroups = asyncErrorWrapper(async (req, res, next) => {
//     const { id } = req.params;

//     const user = await User.findById(id).populate({
//         path: "groups",
//         select: "name",
//         populate: {
//         path: "todos",
//         select: "title",
//     },
//     });

//     const groupData = user.groups.map(group => ({
//         _id: group._id,
//         name: group.name,
//         todoCount: group.todos.length,
//     }));

//     return res.status(200).json({
//         success: true,
//         dataCount: groupData.length,
//         data: groupData,
//     });
// });




module.exports = { createUser, deleteUser, updateUser, getAllUsers, getSingleUser, getUserGroups, deleteAllUsers, verifyAccount, addToContacts, getContacts, imageUpload }