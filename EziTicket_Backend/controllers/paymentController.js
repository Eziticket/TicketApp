const paymentModel = require("../models/paymentModel");
const axios = require('axios');



// a post request to make payment...
const addNewPayment = async (req, res) =>{
    try{
        axios({
        
        })


        const paymentDetails =  await paymentModel.create(req.body); // content to be saved...
        res.status(200).json({
            success: true, 
            message: "payment has been made successfully",
            paymentDetails,  
        });
        console.log("payment made")
    }
    catch (error){
        res.status(400).send("Sorry couldn't make payment "+error);
        console.log("Payment failed...")
    }  
};


// get request of all payments made.....
const getAllPayments = async(req, res) => {
    try{
        const allPayments =  await paymentModel.find({}); // content to be retrieved...
        res.status(200).send(allPayments).json();
    }
    catch (error){
        res.status(400).send("Could not get what you are looking for "+error);
    }  
};



// post request to get payment by userId
const issuedBy = async (req, res) =>{
    const {_userId} = req.body;  
    try{
        await paymentModel.findOne({userId:_userId});  
        res.status(200).json({
            success: true, 
            message:" user found",
        });
        console.log("found user")
    }
    catch (error){
        res.status(400).send("failed to perform action "+ error); 
    }
    console.log(" there is no match")
};


// delete request to remove failed payments
const removePayment = async (req, res) =>{
    const {_failedPayments} = req.body; 
    try{
        await paymentModel.findOneAndDelete({paymentStatus:_failedPayments});  
        res.status(200).json({
            success: true, 
            message: "successfully removed",
        });
        console.log("action completed")
    }
    catch (error){
        res.status(400).send("failed to perform action "+ error); 
    }
    console.log(" Unable to delete")
};

module.exports = {
    removePayment, 
    getAllPayments, 
    addNewPayment, 
    issuedBy
};