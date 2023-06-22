const express = require("express");
const { getAccessToRoute, getAdminAccess } = require("../middlewares/authorization/auth.js");

const {
    createGroup,
    getAllGroups,
    getGroup,
    addUserToGroup,
    deleteGroup,
    removeUserFromGroup,
    getAllGroupUsers,
    deleteAllGroups,
} = require("../controllers/groupController");

const router = express.Router();


router.post("/", getAccessToRoute, createGroup);
router.get("/", getAllGroups);
router.get("/:id", getGroup);

router.post("/users", getAccessToRoute, addUserToGroup);
router.delete("/:groupId", getAccessToRoute, getAdminAccess, deleteGroup);
router.delete("/:groupId/users/:userId", getAccessToRoute, getAdminAccess, removeUserFromGroup);

router.get("/:groupId/users", getAccessToRoute, getAllGroupUsers);

router.delete("/", deleteAllGroups);


module.exports = router;
