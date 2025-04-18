const express = require("express")
const path = require("path")
const handleBars = require("handlebars")
const exphbs = require("express-handlebars")
const { allowInsecurePrototypeAccess } = require("@handlebars/allow-prototype-access")

const app = express()

app.use(express.urlencoded({
    extended: true
}))


app.set("views", path.join(__dirname, "views/"))

app.engine(
    "hbs",
    exphbs.engine({
        handlebars: allowInsecurePrototypeAccess(handleBars),
        extname: "hbs",
        defaultLayout: "layouts/layout",
        layoutsDir: path.join(__dirname, "views/")
    })
)

app.set("view engine", "hbs")

require("./db")
require("./controllers/StudentController")(app)

app.listen(3000, () => {
    console.log("Server is listening on port 3000")
})
