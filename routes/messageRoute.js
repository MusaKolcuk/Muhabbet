const express = require("express");
const { createMessage, deleteMessage, updateMessage, getAllMessages, getSingleMessage, decryptMessage } = require("../controllers/messageController.js");
const { getAccessToRoute } = require("../middlewares/authorization/auth.js");

const router = express.Router();

router.post("/create", getAccessToRoute, createMessage);
router.get("/", getAccessToRoute, getAllMessages);
router.get("/:id", getAccessToRoute, getSingleMessage);
router.put("/:id", getAccessToRoute, updateMessage);
router.delete("/:id", getAccessToRoute, deleteMessage);

router.post("/decrypt", getAccessToRoute, decryptMessage);





module.exports = router;
