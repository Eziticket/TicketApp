const GuestModel = require("../models/guestModel");
const travelDetailsModel = require("../models/travelDetailsModel");


// request to create a guest Account...
const addNewGuest = async (req, res) =>{
    try{
            
            const newGuest =  await GuestModel.create(req.body); // creating guest user..
            const guestId = await newGuest._id;
            
            const updated_BI = await travelDetailsModel.updateOne(req.params.bookingId, {userId: guestId});  //adding user id to booking
            
            res.status(200).json({
                success: true, 
                message: "new guest user added",
                newGuest,  
            });
            console.log("new guest account created successfully")
        
    }
    catch (error){
        res.status(400).send("Auto Guest Account creation Failed: "+error);
        console.log("couldn't create account...")
    }  
}

module.exports = {
    addNewGuest
}