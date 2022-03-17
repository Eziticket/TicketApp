let url;
if(process.env.NODE_ENV === "production"){
  url = process.env.ATLAS_MONGO_URL;
}else{
  url = process.env.LOCAL_DATABASE_URL;
}


//importing models to be used....
const express = require("express");
const mongoose = require("mongoose");
const unless = require('express-unless');
const UserAuthRoute = require("./routes/userAuthRoute");
const bookingDetails = require("./routes/userBookRoute");
const companyOwnerRoute = require("./routes/busOwnersRoute");
const busRoute = require("./routes/bussesRoute");
const busTripRoute = require("./routes/busTripRouter");
const complaintRoute = require("./routes/complaintRoute");
const paymentRoute = require("./routes/paymentRoute");
const guestRoute = require("./routes/guestRoute");
const bookingHistoryRoute = require("./routes/userBookingHistory")
const auth = require("./middleWares/auth");
const errors = require("./middleWares/error");


  mongoose.connect(process.env.LOCAL_DATABASE_URL, { useNewUrlParser: true});// connecting to local database....

  // verifying if mongodb connection above was successful.....
  const db = mongoose.connection;
  db.on("error", console.error.bind(console, "there was a connection error:"));
  db.once("open", function(){
      console.log("local database connected successfully");
      //console.log("Your are successfully connected to the mongodb Atlas");
  });


  // creating a port for our express server....
  const app = express();

  app.use(express.json());

  // middleware Authentication ....
/*   auth.authenticateToken.unless = unless;  //checking if the request made contains a jwt token or not ....
  app.use(
    auth.authenticateToken.unless({
      path: [// routes that do not need to be authenticated by the middleware ....
        {url:"/user/signUp/PersonalDetails", methods: ["POST"]},
        {url:"/user/logIn", methods: ["POST"]},
        {url:"/user/booking_details/destination", methods: ["POST"]},
        {url:"/user/booking_details/selected_bus/:trip_id/:_id", methods: ["PATCH"]},
        {url:"/user/booking_details/seat_number", methods: ["PATCH"]}
      ]
    })
  ) */

app.use("/user", bookingDetails); // the booking process router...
app.use("/user", UserAuthRoute); // all personal details authentication routes except payment..
app.use("/user", complaintRoute);  // all complaint related data....
app.use("/user", paymentRoute);  // payments made through momo channel info 
app.use("/user", bookingHistoryRoute); // booking history of a user from user profile....
app.use("/admin", companyOwnerRoute); // actions related to bus service providers
app.use("/auto_guest", guestRoute); // automatically adds a guest to the system ...
app.use("/admin", busRoute);  //  actions about bus registration...
app.use("/admin", busTripRoute);   // collecting bus trip details to be attached to the user booking...


app.use(errors.errorHandler);


app.listen(process.env.PORT || 3000, ()=>{ // when deploying the server will tell us what port to listen to but for development its 3000
    console.log("server successfully started on port 3000....");
});

// todo : check the middleware controller and apply it to the right places....