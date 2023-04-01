const express = require("express");
require("./db");
require("dotenv").config();

const userRoutes = require("./routes/userRoutes");
const noteRoutes = require("./routes/noteRoutes");

const axios = require("axios");

const cors = require("cors");
const bodyParser = require("body-parser");

const app = express();
app.use(cors());
app.use(bodyParser.json());

app.use(express.json());

// User
app.use("/user", userRoutes);

//notes
app.use("/note", noteRoutes);

app.post("/api", (req, res) => {
  console.log(req.body.message);

  axios
    .post("http://localhost:3001/myName", {
      message: req.body.message,
    })
    .then((response) => {
      console.log(response);
      console.log(response.data);
      res.json({
        success: true,
        message: response.data,
      });
    })
    .catch((error) => {
      console.error(error);
    });
});

//rapid api

app.get("/movieDB", async (req, res) => {
  const options = {
    method: "GET",
    url: "https://moviesdatabase.p.rapidapi.com/titles",
    headers: {
      "X-RapidAPI-Key": "ad93e444admshbb7257b24fc7facp13c95ejsn6fc2c41ee48c",
      "X-RapidAPI-Host": "moviesdatabase.p.rapidapi.com",
    },
  };

  await axios
    .request(options)
    .then(function (response) {
      console.log(response.data);
      res.json({
        success: true,
        message: response.data,
      });
    })
    .catch(function (error) {
      console.error(error);
    });
});

//text translator

app.post("/translate", async (req, res) => {
  const axios = require("axios");

  const encodedParams = new URLSearchParams();
  encodedParams.append("source_language", "auto");
  encodedParams.append("target_language", req.body.targetLang);
  encodedParams.append("text", req.body.toTranslate);

  const options = {
    method: "POST",
    url: "https://text-translator2.p.rapidapi.com/translate",
    headers: {
      "content-type": "application/x-www-form-urlencoded",
      "X-RapidAPI-Key": "ad93e444admshbb7257b24fc7facp13c95ejsn6fc2c41ee48c",
      "X-RapidAPI-Host": "text-translator2.p.rapidapi.com",
    },
    data: encodedParams,
  };

  const answer = await axios.request(options);
  // .then(function (response) {
  //   console.log(response.data);
  // })
  // .catch(function (error) {
  //   console.error(error);
  // });
  if (answer) {
    console.log(answer.data);
    res.json({
      success: true,
      message: answer.data,
    });
  }else{
    res.json({
        success: false,
        message: answer.data,
      })
  }
});

app.listen(process.env.PORT || 3000, () => {
  console.log("The server is up and running at port 3000");
});
