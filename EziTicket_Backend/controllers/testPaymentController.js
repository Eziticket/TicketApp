//create an Immediately Invoked Function Expression (IIFE) that takes in the request object.

/* initializePayment (): 
This function initializes a momo transaction which returns an authorization url or an error as 
the case may be. Its purpose is to initialize the transaction and return the response of the 
request to where it was called. */
const axios = require('axios');

const mtnMomo = (request) =>{
    axios({
        
    })}




    /* const InitializePayment = (form, mycallback) =>{
        const options = {
            url : 'https://sandbox.momodeveloper.mtn.com/v1_0/apiuser',
            headers : {
                // Request headers
                'X-Reference-Id': '',
                'Content-Type': 'application/json',
                'Ocp-Apim-Subscription-Key': '{subscription key}',
            },
           form
        }

        const callback = (error, response, body)=>{
            return mycallback(error, body);
        }
        request.post(options,callback);
    }
    

    }

    const verifyPayment = (ref, mycallback)=>{

    }

    return{InitializePayment, verifyPayment};

} */