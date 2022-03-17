require('dotenv').config();
const User = require("../models/usersModel");
const userAuthModel = require("../models/usersModel");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");



// a post request to signup or create an account with eziTicket...
const addNewUser = async (req, res) =>{
    try{
        const password = hashPassword(req.body.password);
            const newUser =  await userAuthModel.create({...req.body, password}); // content to be saved...
            res.status(200).json({
                success: true, 
                message: "successfully created new user account",
                newUser,  
            });
            console.log("new user account created successfully")
        
    }
    catch (error){
        res.status(400).send("Sorry couldn't create your account.check your connection and try again: "+error);
        console.log("couldn't create account...")
    }  
}


// post request to log user in ....
const logUserIn = async (req, res) =>{ // authenticating user credentials...
    const { emailAddress, password } = req.body;
    try{
        // Authenticate User....
        const user = await userAuthModel.findOne({emailAddress}); //checking user email in db...
        if(user){
            console.log(user);
            isMatch = await User.compare(password, user.password); // verifying or comparing passwords....
            if(isMatch){
                // generate jwt access Token...
                const { _id, emailAddress, isUser } = user;
                const accessToken = jwt.sign({_id, emailAddress, isUser:isUser}, process.env.ACCESS_TOKEN_SECRET, {expiresIn: '2h'})
                res.status(200).json({
                    success: true, 
                    message: "log in successful",
                    accessToken: accessToken,
                });
            }
            else{
                //console.log('Password dont match');
                res.status(400).json({
                    success: false, 
                    message: "Invalid email or password. Check your credentials",  
                });
            }    
        }
        else{
            res.status(400).json({
                success: false, 
                message: "User doesn't exist. Check login credentials or create an account",  
            });
        }
    }
    catch (error){
        res.status(400).send("Incorrect email or password.: "+error);
    }
}


// Patch request to update password....use OTP...
const updateOldPassword = async (req, res) =>{
    const {_id,_newPassword} = req.body;  // new password to be saved..// encrypted...
    try{
        if(!req.user.isUser){
            return res.status(401).json({success: false, message: 'Not authorize to access this page'})
        }

        const password = hashPassword(_newPassword);
        console.log('pass', password, _id);
        await userAuthModel.findByIdAndUpdate({_id}, {password});  
        res.status(200).json({
            success: true, 
            message: "New password saved",
             
        });
    }
    catch (error){
        res.status(401).send("password reset failed.check connection: "+error);
    }
}


// function to hash and salt passwords....
const hashPassword = (password) => {
    const salt = bcrypt.genSaltSync(10);
    newPassword = bcrypt.hashSync(password, salt);
    return newPassword;
}


// request to get all users.....
const getAllUsers= async(req, res) =>{
    const all_Users = await userAuthModel.find({});

    try{
        if(!req.user.isAdmin){
            return res.status(401).json({
                success: false, 
                message: 'Not authorize to access this route'})
        }
        
        if(all_Users.length == 1){
            const one = "showing results for " + all_Users.length + " registered user";
            res.status(200).json({
            success: true, 
            message: one,
            all_Users 
            });
            console.log("getting all registered Users");
         }
         else{
             const moreThanOne = "showing results for " + all_Users.length + " registered users";
             res.status(200).json({
                success: true, 
                message: moreThanOne,
                all_Users 
                });
                console.log("getting all registered Users");
         }    
    }
    catch (error){
        res.status(400).send("The page does not exist" +error);
        console.log("failed to get all owners....")
    }  
}


//todo: learn to apply OTp to verify user login.

module.exports = {
    addNewUser, 
    logUserIn, 
    updateOldPassword,  // resetting password... 
    getAllUsers
};