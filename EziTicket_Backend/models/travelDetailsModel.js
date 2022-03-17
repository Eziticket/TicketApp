const mongoose = require ("mongoose");

// this schema combines info from the three booking pages before the signup page..
// this entity does not have info on the details of the ticket purchased..
const bookingDetails = new mongoose.Schema({
    userId:{type:String , unique:true, default:"none"},
    tripId:{type: String,  unique:true},
    numberOfPassengers:{type: Number, default:0},
    seatNumber:{type: Array,  unique:true},
    date:{type:String, required: true},
    tripType:{type:String, required: true}

}, {timestamps: true})

const  BookingInfo = mongoose.model("BookingInfo", bookingDetails);
module.exports = BookingInfo;