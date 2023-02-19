const mongoose = require("mongoose");
const Schema = mongoose.Schema;
require('dotenv').config();

const noteSchema = new Schema({
    title: {
        type: String,
        required: true
    },
    text: {
        type: String,
    },
    isCompleted: {
        type: Boolean,
        default: false
    },
    user: {
        type: String,
    }
}, {timestamps: true});


const NoteSchema = mongoose.model("user", noteSchema);
module.exports = NoteSchema;