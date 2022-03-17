const express = require("express");
const busOwnerController = require("../controllers/busOwnersController");
const router = express.Router();


router.post("/registerOwner", busOwnerController.addNewCompany);
router.get("/getAllOwners", busOwnerController.getAllOwners);
router.delete("/deleteOwner/", busOwnerController.removeOwner); //ask isaac how to use the params feature..

module.exports = router;