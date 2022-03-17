const express = require("express");
const travelDetailsController = require("../controllers/travelDController");
const router = express.Router();


router.get("/bookingHistory/:userId", travelDetailsController.getbookingHistory);

module.exports = router;