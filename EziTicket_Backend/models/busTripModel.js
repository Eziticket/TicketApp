const mongoose = require ("mongoose");

// contains the trip details of a bus... 
const busTripDetails = new mongoose.Schema({
    busType:{type: String, required:true}, //commented bcoz the bus type in registered bus give this info
    busId:{type: String, required:true, unique:true},
    bookedSeats:{type:Array, default:0},
    from:{type: String, required:true},
    date:{type: String, required:true},
    destination:{type: String, required:true},
    departureTime:{type:String, required:true},

}, {timestamps: true})

const  TripDetails= mongoose.model("busTripInfo", busTripDetails);

module.exports = TripDetails;