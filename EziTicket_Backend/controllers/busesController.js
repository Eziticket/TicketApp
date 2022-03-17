const busModel = require("../models/busesModel");


//request to get all registered buses...
const getAllBuses = async(req, res) =>{
    const buses = await busModel.find({});

    try{
        if(buses.length == 1){
            const one = "showing results for " + buses.length + " registered bus";
            res.status(200).json({
            success: true, 
            message: one,
            buses 
            });
            console.log("getting all registered buses");
         }
         else{
             const moreThanOne = "showing results for " + buses.length + " registered buses";
             res.status(200).json({
                success: true, 
                message: moreThanOne,
                buses 
                });
                console.log("getting all registered buses");
         }    
    }
    catch (error){
        res.status(400).send("The page does not exist" +error);
        console.log("failed to get all buses....")
    }  
}


//post request to add a new bus...
const addNewBus = async (req, res) =>{
    try{
        const newBus =  await busModel.create(req.body); // content to be saved...
        res.status(200).json({
            success: true, 
            message: "Bus Added",
            newBus,  
        });
        console.log("A new bus has been added");
    }
    catch (error){
        res.status(400).send("Operation failed" +error);
        console.log("couldn't complete action....")
    }  
}


// delete request to remove a bus...
const removeBus = async (req, res) =>{
    const _id = req.body;
    try{
        await busModel.findByIdAndDelete(_id); // content to be saved...
        res.status(200).json({
            success: true, 
            message: "Operation successful",
             
        });
        console.log("Bus Removed");
    }
    catch (error){
        res.status(400).send("Operation failed" +error);
        console.log("couldn't complete action....")
    } 
     
}
module.exports = {
    removeBus,
    addNewBus,
    getAllBuses
};