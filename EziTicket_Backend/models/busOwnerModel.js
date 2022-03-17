const mongoose = require ("mongoose");

//schema for bus Owners...
const BusCompanySchema = new mongoose.Schema({
    companyName: {type: String, required: true},
    email: {type: String, required: true}, 
    numOfBuses:{type:String },
    phone:{ type:String},
    accountNumber: {type: String, required: true, unique:true},
    accountName: {type: String, required: true},
    
}, {timestamps: true});

// creating the collection...
const BusOwner = mongoose.model("BusCompany", BusCompanySchema);
module.exports = BusOwner;