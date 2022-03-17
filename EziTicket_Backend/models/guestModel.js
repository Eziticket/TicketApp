const mongoose = require ("mongoose");

const GuestSchema = new mongoose.Schema({ 
    isGuest:{type: Boolean,  default:true},
    
}, {timestamps: true});

const Guest = mongoose.model("Guest", GuestSchema);

module.exports = Guest;