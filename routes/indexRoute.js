// Bu sayfada tüm route dosyalarını tek bir dosyada toplayacağız. Bu sayede app.js dosyasında tek bir dosyayı import ederek tüm route dosyalarını kullanabileceğiz.

const express = require('express');

const auth = require('./authRoute');
const user = require('./userRoute');
const admin = require('./adminRoute');
const group = require('./groupRoute');
const message = require('./messageRoute');
const conversation = require('./conversationRoute');

const router = express.Router();

router.use("/auth", auth);
router.use("/users", user);
router.use("/admin", admin);
router.use("/group", group);
router.use("/message", message);
router.use("/conversation", conversation);




module.exports = router;

