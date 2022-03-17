const req = require("express/lib/request");
const busOwnerModel = require("../models/busOwnerModel");


// a post request to register company with eziTicket...
const addNewCompany = async (req, res) =>{
    try{
        const newCompany =  await busOwnerModel.create(req.body); // content to be saved...
        res.status(200).json({
            success: true, 
            message: "successfully created new Company account",
            newCompany,  
        });
        console.log("new Company account created successfully")
    }
    catch (error){
        res.status(400).send("Sorry couldn't register this company "+error);
        console.log("couldn't create account...")
    }  
}


// delete request to remove a company
const removeOwner = async (req, res) =>{
    const {_id} = req.body;  // owner to be deleted..
    
    try{
        await busOwnerModel.findByIdAndDelete({_id});
        res.status(200).json({
            success: true, 
            message: _id + " has been deleted successfully",
        });
        console.log(_id)
        // speak to isaac, i get success codes in postman even after the document has been deleted ..why?

        
    }
    catch (error){
        res.status(400).send("failed to perform action "+ error); 
    }
    console.log(" Unable to delete company")
}


// get request for all registered  users.....
const getAllOwners = async(req, res) =>{
    const all_owners = await busOwnerModel.find({});

    try{
        if(all_owners.length == 1){
            const one = "showing results for " + all_owners.length + " registered users";
            res.status(200).json({
            success: true, 
            message: one,
            all_owners 
            });
            console.log("getting all registered Owners");
         }
         else{
             const moreThanOne = "showing results for " + all_owners.length + " registered users";
             res.status(200).json({
                success: true, 
                message: moreThanOne,
                all_owners 
                });
                console.log("getting all registered Owners");
         }    
    }
    catch (error){
        res.status(400).send("The page does not exist" +error);
        console.log("failed to get all owners....")
    }  
}

module.exports = {
    addNewCompany, 
    getAllOwners, 
    removeOwner
};