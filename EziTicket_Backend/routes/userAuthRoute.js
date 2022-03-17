const express = require("express");
const usersAuthController = require("../controllers/usersAuthController");
const { authenticateToken } = require("../middleWares/auth");
const router = express.Router();

// various CRUD operations the user can perform base on this routes and model schema...
router.patch("/resetPassword/", authenticateToken, usersAuthController.updateOldPassword)
router.post("/signUp/PersonalDetails", usersAuthController.addNewUser);
router.post("/logIn", usersAuthController.logUserIn);
router.get("/getAllUsers", authenticateToken, usersAuthController.getAllUsers)

// sendOTP
// verifyOTP

module.exports = router;