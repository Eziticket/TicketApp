const express = require("express");
const paymentController = require("../controllers/paymentController");
const { authenticateToken } = require("../middleWares/auth");
const router = express.Router();

// various CRUD operations the user can perform base on this routes and model schema...
router.post("/checkout/payment", paymentController.addNewPayment);
router.get("/payments", authenticateToken, paymentController.getAllPayments);
router.delete("/payments/delete", authenticateToken, paymentController.removePayment);
router.post("/payments/getById", authenticateToken,paymentController.issuedBy);

module.exports = router;