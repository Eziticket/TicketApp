const express = require("express");
const busTripController = require("../controllers/busTripController");
const router = express.Router();

// various CRUD operations the user can perform base on this routes and model schema...
//router.patch("/updateSeatInfo", busTripController.updateBookedSeat);
router.get("/getTripDetails", busTripController.getAllTripDetails);
router.post("/addTrip", busTripController.AddTrip);

module.exports = router;
