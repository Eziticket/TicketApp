const mongoose = require ("mongoose");
const bcrypt = require('bcrypt')

// schema for users or travelers...
const UserSchema = new mongoose.Schema({ 
    fullName:{type: String, required: true},
    emailAddress: {type :String, unique:true , required: true},
    phoneNumber: {type :String,required: true, unique:true},
    password:{type : String,unique:true,required: true},
    region: {type : String,required: true},
    gender: {type : String,required: true},
    age: {type :Number, default:0, required: true},
    town: {type :String,required: true},
    isUser: {type: Boolean , required:true, default: true}
    
}, {timestamps: true});


// verifying user credentials.......code continues in the associate controller....
UserSchema.statics.compare = async function (savedPass, enteredPass){
    //console.log(savedPass, enteredPass);
    return await bcrypt.compare(savedPass, enteredPass);
}

// removing data that we dont want to send to the client-side..
UserSchema.set("toJSON", {
    transform: (document, returnedObject) => {
        delete returnedObject.__v;
        delete returnedObject.password;
    }
})

// initializing or creating the Users collection...
const User = mongoose.model("User", UserSchema);

module.exports = User;