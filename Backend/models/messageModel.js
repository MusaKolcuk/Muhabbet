const mongoose = require("mongoose");

const MessageSchema = new mongoose.Schema({
    content: {
        type: String,
        required: [true, "Please provide a message content"],
    },
    sender: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "User",
        required: [true, "Please provide a sender"],
    },
    receiver: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "User",
    },
    groupId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "Group",
    },
    createdAt: {
        type: Date,
        default: Date.now,
    },
    updatedAt: {
        type: Date,
        default: Date.now,
    },
    encryptionKey: {
        type: String,
        required: true,
    },
    iv: {
        type: String,
        required: true,
    },
});

MessageSchema.pre("save", function (next) {
    this.updatedAt = new Date();
    next();
});

module.exports = mongoose.model("Message", MessageSchema);
