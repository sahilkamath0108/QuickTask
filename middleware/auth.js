require("dotenv").config()
const jwt = require("jsonwebtoken")
const UserSchema = require("../models/userSchema")

const authToken = async (req, res, next)=> {
    try{
    const authHeader =req.header('Authorization')
    const token = authHeader && authHeader.split(" ")[1]
    if(token == null) return res.sendStatus(401)

    const decode = jwt.verify(token, process.env.ACCESS_TOKEN_SECRET)
    const user = await UserSchema.findById({_id : decode._id})

    if(!user){
        res.status(404).json({
            message: "User not found"
        })
    }else{
        req.user = user
        next()
    }  
} catch(e){
    res.status(401).json({
        success: false,
        message: e.message
    })
}
}

module.exports = {
    authToken
}