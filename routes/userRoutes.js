const express = require("express")

const userC = require("../controllers/userC")
const auth = require("../middleware/auth")

const router = express.Router()


//create user

router.post("/new", userC.createUser)

//upload profile picture

router.post("/uploadPfp", auth.authToken , userC.fileVerifyPfp.single('pfp'), userC.uploadPfp )

//login user

router.post("/login", userC.loginUser)

// delete user

router.delete("/delete", auth.authToken ,userC.deleteUser)

//updating user info

router.put("/update", auth.authToken ,userC.updateUser)


module.exports = router

