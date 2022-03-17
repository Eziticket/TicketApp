const busTripModel = require("../models/busTripModel");

// adding trip details of busses...
const AddTrip = async (req, res) =>{
    try{
        const trip =  await busTripModel.create(req.body);
        res.status(200).json({
            success: true, 
            message: "trip details added",
            trip,
        });
    }
    catch (error){
        res.status(400).send("failed to save bus trip details: "+error);
    }
};


// get all available trip details of buses...
/* const getAllTripDetails = async (req, res) =>{
    try{
        res.status(200).json({
            success: true,  
        });
        console.log("getting all buses trip details");
    }
    catch (error){
        res.status(400).send("The page does not exist" +error);
        console.log("check connection....")
    }  
}; */

const getAllTripDetails= async(req, res) =>{
    const all_availableTrips = await busTripModel.find({});

    try{
        if(all_availableTrips.length == 1){
            const one = "showing results for " + all_availableTrips.length +  " available Trips";
            res.status(200).json({
            success: true, 
            message: one,
            all_availableTrips
            });
            console.log("getting available Trips");
         }
         else{
             const moreThanOne = "showing results for " + all_availableTrips.length + " available Trips";
             res.status(200).json({
                success: true, 
                message: moreThanOne,
                all_availableTrips 
                });
                console.log("getting available Trips");
         }    
    }
    catch (error){
        res.status(400).send("The page does not exist" +error);
        console.log("failed to get available Trips....")
    }  
}


/* // updating trip booked seats details...
const updateBookedSeat = async (req, res) => { // speak with Isaac concerning this line
    const {_id, bus_id} = req.body;
    try{
        await TripDetails.findByIdAndUpdate({_id}, {busId: bus_id});
        res.status(200).json({
            success: true, 
            message: "Info successfully updated",
        });
    }
    catch(error){
        res.send("Sorry unable update info.Please check your internet connection and try again")
        res.send.status(500).send(error);
    }
}; */

module.exports = {
    //updateBookedSeat, 
    getAllTripDetails, 
    AddTrip
};
