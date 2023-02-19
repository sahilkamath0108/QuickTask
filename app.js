const express = require("express")
require("./db")
require('dotenv').config()

const userRoutes = require("./routes/userRoutes")
const noteRoutes = require("./routes/noteRoutes")

const cors = require("cors")
const bodyParser = require("body-parser")

const app = express()
app.use(cors())
app.use(bodyParser.json());



app.use(express.json())

// User 
app.use('/user',userRoutes)

//notes
app.use('/note',noteRoutes)


app.listen(process.env.PORT || 3000, ()=>{
  console.log('The server is up and running at port 3000')
})


