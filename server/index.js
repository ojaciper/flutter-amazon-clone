// IMPORTS FROM PACKAGES
const express = require('express');
const mongoose = require('mongoose');
//IMPORT FROM OTHER FILES
const authRouter = require("./routes/auth");
const adminRouter = require("./routes/admin");
const productRouter = require('./routes/product');
const userRouter = require('./routes/user');

// INIT
const PORT = 3000; 
const app = express();
const DB = "mongodb+srv://osas:12345@cluster0.dfoib.mongodb.net/?retryWrites=true&w=majority";
// CREATING  AN API
// GET, PUT, POST, DELETE, UPDATE, -> GRUD  
// http://<youripaddress>/hello-world

// MIDDLEWARE
app.use(express.json());
app.use(authRouter);    
app.use(adminRouter);
app.use(productRouter );
app.use(userRouter);

// Connections
mongoose.connect(DB).then(()=>{
    console.log("Connection Successful to DB");
}).catch((e)=>{
    console.log(e);
});
  
app.listen(PORT, "0.0.0.0", ()=>{
    console.log(`connected at port ${PORT}`);
});   