const mongoose = require ("mongoose");

// contains payment details of a user... 
const PaymentSchema = new mongoose.Schema({
    paymentAgent:{type: String, required:true},
    mobileNumber:{type: String, required:true},
    amount:{type: Number, required:true},

    //automatically generated info below...
    transactionId:{type: String, required:true, unique:true},
    transactionName:{type: String, required:true},
    paymentStatus:{type: String, required:true},
    date:{type: String, required:true},
    time:{type: String, required:true},
    bookingId:{type: String, required:true, unique:true},  // can be a guest or member...
    

}, {timestamps: true})

const  Payment = mongoose.model("Payment", PaymentSchema);

module.exports = Payment;