require("dotenv").config();

const UserSchema = require("../models/userSchema");
const NoteSchema = require("../models/noteSchema");

const otpGenerator = require("otp-generator");
const multer = require("multer");

//create note

const createNote = async (req, res) => {
  try {
    const newNote = new NoteSchema(req.body);
    const savedNote = await newNote.save();
    const userId = req.user._id;

    await UserSchema.findOneAndUpdate(
      { _id: userId },
      { $push: { note: savedNote._id } }
    );
    await NoteSchema.findByIdAndUpdate({_id: savedNote._id}, { $set : {user : userId}})

    res.json({
      success: true,
      data: newNote,
    });
  } catch (e) {
    res.json({
      success: false,
      message: e.message,
    });
  }
};

//update note

const updateNote = async (req, res) => {
  try {
    const updates = Object.keys(req.body);
    const allowedUpdates = ["title", "text"];
    const isValidOperation = updates.every((update) =>
      allowedUpdates.includes(update)
    );

    if (!isValidOperation) {
      return res.status(400).send({ error: "Invalid Updates!" });
    }

    await NoteSchema.findOneAndUpdate(
      { _id: req.params.id },
      { $set: req.body }
    );
    const data = await NoteSchema.findById({ _id: req.params.id });
    res.status(201).json({
      success: true,
      data: data,
    });
  } catch (err) {
    res.status(500).json({
      success: false,
      message: err.message,
    });
  }
};

//delete note

const deleteNote = async (req, res) => {
  try {
    const info = await NoteSchema.deleteOne({ _id: req.params.id });
    res.status(200).json({
      success: true,
      message: info,
    });
  } catch (err) {
    res.status(400).json({
      success: false,
      message: err.message,
    });
  }
};

//complete note

const completeNote = async (req,res) => {
    try{
    const id = req.params.id
    const complete = await NoteSchema.findByIdAndUpdate({ _id : id}, { isCompleted : true})

    res.status(201).json({
        success: true,
        message: complete
    })

    }catch(e){
        res.json({
            success: true,
            message: e.message
        })
    }
}

//get incompletetasks

const getIncomplete = async (req,res) => {
    try{

    const userId =  req.user._id
    const incomplete = await NoteSchema.find({user: userId, isCompleted: false})

    res.status(200).json({
        success: true,
        data : incomplete
    })
    }catch(e){
        res.json({
            success : false,
            message: e.message
        })
    }
}

//get complete tasks

const getComplete = async (req,res) => {
    try{
        
    const userId =  req.user._id
    const complete = await NoteSchema.find({user: userId, isCompleted: true})

    res.status(200).json({
        success: true,
        data : complete
    })
    }catch(e){
        res.json({
            success : false,
            message: e.message
        })
    }
}

module.exports = {
  createNote,
  updateNote,
  deleteNote,
  completeNote,
  getIncomplete,
  getComplete
};
