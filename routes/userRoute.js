const express = require("express");
const { createUser, deleteUser, updateUser, getAllUsers, getSingleUser, getUserGroups, deleteAllUsers, verifyAccount, addToContacts, getContacts, imageUpload } = require("../controllers/userController.js");
const { checkUserExist } = require("../middlewares/database/databaseErrorHelpers.js");
const { getAccessToRoute, getAdminAccess } = require("../middlewares/authorization/auth.js");

const profileImageUpload = require("../middlewares/libraries/profileImageUpload.js");

const router = express.Router();

router.post("/create", createUser);
router.get("/", getAllUsers);
router.get("/:id", checkUserExist, getSingleUser);
router.put("/:id", checkUserExist, getAccessToRoute, updateUser);
router.delete("/:id", checkUserExist, deleteUser);
router.delete("/", deleteAllUsers)

router.get("/:id/groups", checkUserExist, getUserGroups);

router.post("/verify-account", verifyAccount);

router.post("/:userId/add-contact/:contactId", getAccessToRoute, addToContacts);

router.get("/:id/contacts", getAccessToRoute,getContacts);

router.post("/upload", [getAccessToRoute, profileImageUpload.single("profile_image")],imageUpload); //single: tek dosya yukleme









module.exports = router;