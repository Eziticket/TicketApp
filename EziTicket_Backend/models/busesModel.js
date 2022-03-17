const mongoose = require ("mongoose");

// Schema for buses....
const BusSchema = new mongoose.Schema({
    ownedBy: {type: String, required: true},
    license_Num: {type: String, required: true, unique:true},
    busType:{type:String},
    totalSeats: {type: Number, required: true},
    route: {type: String, required: true},
    ticketPrice:{type:String},
    busStatus:{type:String, default:"Empty"}
    
}, {timestamps: true});

const Bus = mongoose.model("Bus", BusSchema);

module.exports = Bus;