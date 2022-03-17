const express = require("express");
const bookingController = require("../controllers/travelDController");
const router = express.Router();

/*  ******************* the booking process and it's various routes ************************* */

// various CRUD operations the user can perform base on this route and model schema...
router.post("/booking_details/destination", bookingController.addBookingDetails_1);  // details from booking page1
router.patch("/booking_details/selected_bus/:trip_id/:_id", bookingController.addBookingDetails_2);  // details from booking page2
router.patch("/booking_details/seat_number/:trip_id/:bookingId", bookingController.addBookingDetails_3);  // details from booking page3

module.exports = router; 