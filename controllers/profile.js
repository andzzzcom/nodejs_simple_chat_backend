const db            = require("./db")

module.exports.profile = (req, res)=>{
    db.query("SELECT * FROM messages", function(err, rows, fields){
        if(err) throw err

        res.status(200).json({data:rows})
    })
}