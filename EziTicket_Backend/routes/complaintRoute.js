const express = require("express");
const complainController = require("../controllers/complaintController");
const { authenticateToken } = require("../middleWares/auth");
const router = express.Router();

// various CRUD operations the user can perform base on this routes and model schema...
router.post("/userProfile/reportIssue", authenticateToken, complainController.addNewComplaint);
router.get("/getAllComplaints", authenticateToken, complainController.getAllComplaints);
router.delete("/Admin/deleteComplaints", authenticateToken, complainController.removeComplaint);

module.exports = router;

