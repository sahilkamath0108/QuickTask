const express = require("express")

const noteC = require("../controllers/noteC")
const auth = require("../middleware/auth")

const router = express.Router()


//create note

router.post("/new", noteC.createNote)

// delete note

router.delete("/delete", auth.authToken ,noteC.deleteNote)

//updating note

router.put("/update", auth.authToken ,noteC.updateNote)

//complete note

router.post("/complete/:id", auth.authToken, noteC.completeNote)

//get incomplete tasks

router.get("/getIncomplete", auth.authToken, noteC.getIncomplete)

//get complete tasks

router.get("/getComplete", auth.authToken, noteC.getComplete)


module.exports = router

