const express       = require("express")
const bodyParser    = require("body-parser")
const cookieParser  = require("cookie-parser")
const env           = require("dotenv")
        env.config()
const db            = require("./controllers/db")
const routes        = require("./routes/routes")

const app           = express()

app.use(bodyParser.urlencoded({extended:false}))
app.use(bodyParser.json())

//routes api
app.use('/api/v1', routes)

const server        = app.listen(process.env.PORT, function(){
    console.log("Server Started At PORT: "+ process.env.PORT)
})