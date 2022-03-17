const travelDetailsModel = require("../models/travelDetailsModel");
const busTripModel= require("../models/busTripModel");
const busesModel = require("../models/busesModel");

// collecting travel details from booking page1...
const addBookingDetails_1 = async (req, res) =>{
    try{
        const available_buses = [];
        //console.log(req.body);
        const currentUserLocation = req.body.from
        const user_destination = req.body.destination
        const travel_date = req.body.date;
        const user_busType = req.body.busType
        
        const all_availableTrips = await busTripModel.find({});
        const buses = await busesModel.find({});

        //console.log('buses: ', buses);

        for (let index = 0; index < all_availableTrips.length; index++) {  // looking for available trips...
            const trip = all_availableTrips[index];
            //console.log('trip: ', trip);
            const { busId, from, destination, date , busType} = trip;  // filtering parameters ....
            const bus = buses.filter((bus)=>bus._id.toString() === busId)[0];  // getting correspondent bus...
            //console.log('bus: ', bus);
            if(trip.bookedSeats.length < bus.totalSeats  // comparing filtering parameters ...
                && from.toLowerCase() === currentUserLocation.toLowerCase()
                && destination.toLowerCase() === user_destination.toLowerCase() 
                && busType.toLowerCase() === user_busType.toLowerCase() 
                && date === travel_date
            ){
                const { ownedBy,  license_Num, ticketPrice } = bus;
                const { _id ,  busType, busId, from, date, destination, departureTime } = trip;

                available_buses.push({
                    ownedBy,  license_Num, ticketPrice, trip_id: _id ,  busType, busId, from, date, destination, departureTime
                });
                console.log(available_buses);
            }
        }

        const {_id} =  await travelDetailsModel.create(req.body);
        res.status(200).json({
            success: true, 
            message: "showing Results for " + available_buses.length + " available buses",
            booking_id: _id,
            available_buses
        });
    }
    catch (error){
        // res.send("couldn't search for available buses please try again")
        res.status(400).send("couldn't search for available buses please try again: "+error);
    }
}


// this function looks for all booked seats and eliminates from all available seats...
const getAvailableBusSeat = (totalSeats, bookedSeats) => {
    console.log("TS: "+totalSeats, "BS: ", bookedSeats);
    const available_seats = [];
    for (let seat = 1; seat <= totalSeats; seat++) {
        const isBooked = bookedSeats.includes(seat);
        if(!isBooked){
            available_seats.push(seat);
        }
    }
    return available_seats;
}


// updating travel details using info from booking page2...
const addBookingDetails_2 = async (req, res) => {
    try{
        const tripDetails = await busTripModel.find({_id: req.params.trip_id});
        const { bookedSeats, busId, from, date,departureTime,ticketPrice } = tripDetails[0];
        const busDetails  = await busesModel.find({_id: busId});
        const { totalSeats, license_Num} = busDetails[0];
        const bookingDetails = await travelDetailsModel.findByIdAndUpdate(req.params._id,{tripId: req.params.trip_id});
        const available_seats = getAvailableBusSeat(totalSeats, bookedSeats);
        res.status(200).json({
            success: true, 
            message: "Bus selected saved",
            numOfPassengers: bookingDetails.numberOfPassengers, 
            booking_id: bookingDetails._id,
            trip_id: req.params.trip_id,
            from, date, departureTime,license_Num,ticketPrice,
            available_seats
        });
        
    }
    catch(error){
        // res.send("Sorry unable to add your selected coach.Please check your internet connection and try again")
        res.status(500).send(error);
    }
}


// updating travel details using info from booking page3....
const addBookingDetails_3 = async (req, res) =>{

    console.log("your selected seat has been saved")
    const seatNumber = req.body.seatNumber;
    const tripDetails = await busTripModel.find({_id: req.params.trip_id});
    try{
        await travelDetailsModel.findByIdAndUpdate(req.params.bookingId,{seatNumber});
        console.log(req.params.booking_id);
        const seat_number = tripDetails[0].bookedSeats;
        console.log(tripDetails[0].bookedSeats);
        seatNumber.forEach((seat)=>{
            //console.log(seat)
            seat_number.push(seat);

        });

        await busTripModel.findByIdAndUpdate(req.params.trip_id,{bookedSeats: seat_number});
        
        res.status(200).json({
            success: true, 
            message: "Booking process completed",
        });
    }
    
    catch(error){
        //res.send("Unable to save. check connection and try again")
        res.status(500).send(error);
    }
}


// get request for all registered  users.....
const getbookingHistory = async(req, res) =>{
    try{
        const bookingHistory = await travelDetailsModel.find({userId: req.params.userId});  // finding the booking history of a user 
        if(bookingHistory.length == 1){
            const one = "showing results for " + bookingHistory.length + " booking";
            res.status(200).json({
            success: true, 
            message: one,
            bookingHistory
            });
            console.log("getting all user bookings..");
         }

         else{
             const moreThanOne = " showing results for " + bookingHistory.length + " bookings";
             res.status(200).json({
                success: true, 
                message: moreThanOne,
                bookingHistory
                });
                console.log(" getting bookings ");
         }    
    }
    catch (error){
        res.status(400).send("The page does not exist" +error);
        console.log("failed to get all owners....")
    }  
}


module.exports = {
    addBookingDetails_1, 
    addBookingDetails_2, 
    addBookingDetails_3,
    getbookingHistory,
};