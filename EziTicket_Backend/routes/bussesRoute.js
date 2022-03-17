const express = require("express");
const busesController = require("../controllers/busesController");
const router = express.Router();

//GRUD OPERATIONS...
router.get("/allBuses", busesController.getAllBuses)
router.post("/addNew_bus", busesController.addNewBus);
router.delete("/removeBus", busesController.removeBus);

module.exports = router;