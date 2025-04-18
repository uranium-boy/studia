const mongoose = require("mongoose")

//mongoose.connect("mongodb://127.0.0.1:27017/StudentDB")
mongoose.connect("mongodb+srv://studentDBUser:IDon'tLikeNoSql111@cluster0.4wkzw1o.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0")
    .then((result) => {
        console.log("Connected to the database.")
    })
    .catch((err) => {
        console.log("Cannot connect to the MongoDB database. Error: " + err)
    })
