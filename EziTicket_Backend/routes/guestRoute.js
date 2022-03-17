const express = require("express");
const guestController = require("../controllers/guestController");
const router = express.Router();


router.post("/addNew_guest/:bookingId", guestController.addNewGuest);


module.exports = router;