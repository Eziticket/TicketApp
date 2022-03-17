const complaintModel = require("../models/conplaintModel");

// getting all available complains...
const getAllComplaints = async (req, res) =>{ // speak to Issac about this line...how to get who the issues relate to..
    try{
        res.status(200).json({
            success: true,  
        });
        console.log("fetching all complaints");
    }
    catch (error){
        res.status(400).send("fetching data failed" +error);
        console.log("check connection....")
    }  
};


// adding new complaints ....
const addNewComplaint = async (req, res) =>{
    try{
        const newComplaint =  await complaintModel.create(req.body); // content to be saved...
        res.status(200).json({
            success: true, 
            message: "Complaint sent successfully",
            newComplaint,  
        });
        console.log("A new complaint has been received");
    }
    catch (error){
        res.status(400).send("Sending failed" +error);
        console.log("failed to send complaint....")
    }  
};


// delete request to remove complaints attended to after a period of time by admins...
const removeComplaint = async (req, res) =>{
    const {_resolvedIssue} = req.body;  // complaint to be deleted..
    try{
        await complaintModel.findOneAndDelete({status:_resolvedIssue});  
        res.status(200).json({
            success: true, 
            message: " Action has been completed successfully",
        });
        console.log(" expired issues deleted")
    }
    catch (error){
        res.status(400).send("failed to perform action "+ error); 
    }
    console.log(" Unable to delete resolved issues")
}

module.exports = {
    removeComplaint,
    addNewComplaint,
    getAllComplaints
};