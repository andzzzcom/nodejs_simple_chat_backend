const db            = require("./db")

module.exports.chat = (req, res)=>{
    db.query("SELECT * FROM messages", function(err, rows, fields){
        if(err) throw err

        res.status(200).json({data:rows})
    })
}

module.exports.insertMessage = (req, res)=>{
    db.query('INSERT INTO messages(id_user, content, status) VALUES(?, ?, ?)', [req.body.idUser, req.body.message, 1], (err, rows, field)=>{
        if(err){
            res.status(200).json({
                insert:false
            })
        }else{
            res.status(200).json({
                insert:true
            })
        }
    })
}

module.exports.updateUser = (req, res)=>{
    db.query('UPDATE users SET ? WHERE id_user=?', [{description:Math.random()}, req.body.idUser], (err, rows, field)=>{
        if(err){
            res.status(200).json({
                update:-1
            })
        }else{
            res.status(200).json({
                update:req.body.idUser
            })
        }
    })
}

module.exports.onlineUsers = (req, res)=>{
    db.query('SELECT * FROM users WHERE last_online >= NOW() - INTERVAL 1 MINUTE', (err, rows, field)=>{
        if(err){
            res.status(200).json({
                data:err
            })
        }else{
            res.status(200).json({
                data:rows
            })
        }
    })
}