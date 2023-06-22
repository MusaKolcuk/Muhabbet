const mongoose = require("mongoose");

const conversationSchema = new mongoose.Schema({
    participants: [
        {
            type: mongoose.Schema.Types.ObjectId,
            ref: "User",
        },
    ],
    groupId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "Group",
    },
    messages: [
        {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'Message',
        },
    ],
    createdAt: {
        type: Date,
        default: Date.now,
    },
    updatedAt: {
        type: Date,
        default: Date.now,
    },
})

// Bu method ile conversation olusturuldu.
conversationSchema.statics.findOrCreate = async function (groupId) {
    let conversation = await this.findOne({ groupId });

    if (!conversation) {
        conversation = new this({ groupId });
        await conversation.save();
    }

    return conversation;
};

module.exports = mongoose.model("Conversation", conversationSchema);
