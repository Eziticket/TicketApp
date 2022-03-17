const mongoose = require ("mongoose");

// Schema for complaints....
const ComplaintSchema = new mongoose.Schema({
    UserId: {type: String, required: true, unique:true},
    IssueId: {type: String, required: true, unique:true},
    date: {type: String, required: true},
    time: {type: String, required: true},
    title: {type: String, required: true},
    content: {type: String, required: true,},
    status:{type:String, default:"Unattended"}

},{timestamps: true});

const Complaints = mongoose.model("UserComplaint", ComplaintSchema);

module.exports = Complaints;