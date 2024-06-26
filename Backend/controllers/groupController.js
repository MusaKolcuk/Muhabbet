const Group = require("../models/groupModel");
const User = require("../models/userModel");
const CustomError = require("../helpers/error/CustomError");
const asyncErrorWrapper = require("express-async-handler");
const { sendJwtToClient } = require("../helpers/authorization/tokenHelpers");


// Yeni bir grup oluşturma
const createGroup = asyncErrorWrapper(async (req, res, next) => {
  const { name, members, roles, isPrivate } = req.body;
  const creatorId = req.user.id;

  const groupMembers = Array.isArray(members) ? members : [];
  const groupRoles = Array.isArray(roles) ? roles : [];

  const group = await Group.create({
    name,
    members: [
      ...groupMembers.map((member, index) => ({
        user: member,
        role: groupRoles[index] || "user",
      })),
      {
        user: creatorId,
        role: "admin",
      },
    ],
    isPrivate: isPrivate || false,
  });

  const creator = await User.findById(creatorId);
  creator.groups.push(group._id);
  await creator.save();

  return res.status(201).json({
    success: true,
    message: "Group created successfully",
    data: group,
  });
});





// Grubu silme
const deleteGroup = asyncErrorWrapper(async (req, res, next) => {
  const { groupId } = req.params;
  const { user } = req; // Oturum açmış kullanıcının bilgileri

  let group;
  try {
    group = await Group.findByIdAndDelete(groupId);
  } catch (err) {
    return next(new CustomError("An error occurred while deleting the group", 500));
  }

  if (!group) {
    return next(new CustomError("Group not found", 404));
  }

  // Grubu oluşturan kişi veya admin rolüne sahip kullanıcıların grupları silebilmesini kontrol et
  if (
    (group.createdBy && group.createdBy.toString() !== user.id) &&
    (!user.roles || !user.roles.includes("admin"))
  ) {
    return next(new CustomError("You are not authorized to delete this group", 403));
  }


  return res.status(200).json({
    success: true,
    message: "Group deleted successfully",
  });
});



// Tüm grupları getirme
const getAllGroups = asyncErrorWrapper(async (req, res, next) => {
  const groups = await Group.find();

  return res.status(200).json({
    success: true,
    data: groups,
  });
});

// Belirli bir gruptaki bilgileri getirme
const getGroup = asyncErrorWrapper(async (req, res, next) => {
  const { id } = req.params;

  const group = await Group.findById(id);

  if (!group) {
    return next(new CustomError("Group not found", 404));
  }

  return res.status(200).json({
    success: true,
    data: group,
  });
});

// Bir gruba kullanıcı ekleme
const addUserToGroup = asyncErrorWrapper(async (req, res, next) => {
  const { groupId, userId } = req.body;

  const group = await Group.findById(groupId);

  if (!group) {
    return next(new CustomError("Group not found", 404));
  }

  const isUserInGroup = group.members.some(
    (member) => member.user.toString() === userId
  );

  if (isUserInGroup) {
    return next(new CustomError("User is already in the group", 400));
  }

  group.members.push({ user: userId, role: "user" });
  await group.save();

  return res.status(200).json({
    success: true,
    message: "User added to the group successfully",
  });
});


// Bir kullanıcıyı gruptan çıkarma sadece admin çıkarabilir
const removeUserFromGroup = asyncErrorWrapper(async (req, res, next) => {
  const { groupId, userId } = req.params;

  const group = await Group.findById(groupId);

  if (!group) {
    return next(new CustomError("Group not found", 404));
  }

  // Kullanıcının grupta olup olmadığını kontrol etme
  const isUserInGroup = group.members.some(
    (member) => member.user.toString() === userId
  );

  if (!isUserInGroup) {
    return next(new CustomError("User is not in the group", 400));
  }

  group.members = group.members.filter(
    (member) => member.user.toString() !== userId
  );

  await group.save();

  return res.status(200).json({
    success: true,
    message: "User removed from the group successfully",
  });
});

// Bir gruptaki tüm kullanıcıları getirme
const getAllGroupUsers = asyncErrorWrapper(async (req, res, next) => {
  const { groupId } = req.params;

  const group = await Group.findById(groupId).populate("members.user");

  if (!group) {
    return next(new CustomError("Group not found", 404));
  }

  const users = group.members.map((member) => member.user);

  return res.status(200).json({
    success: true,
    data: users,
  });
});

const deleteAllGroups = asyncErrorWrapper(async (req, res, next) => {
  await Group.deleteMany();

  return res.status(200).json({
    success: true,
    message: "All groups deleted successfully",
  });
});



module.exports = {
    createGroup,
    deleteGroup,
    getAllGroups,
    getGroup,
    addUserToGroup,
    removeUserFromGroup,
    getAllGroupUsers,
    deleteAllGroups
};
