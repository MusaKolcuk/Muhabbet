const express = require("express");
const { createConversation, getAllConversations, getSingleConversation } = require("../controllers/conversationController");
const { getAccessToRoute } = require("../middlewares/authorization/auth");

const router = express.Router();

router.post("/create", getAccessToRoute, createConversation);
router.get("/", getAccessToRoute, getAllConversations);
router.get("/:id", getAccessToRoute, getSingleConversation);




module.exports = router;
