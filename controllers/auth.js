const db            = require("./db")
const bcrypt        = require("bcrypt")

module.exports.login = (req, res)=>{
    const email     = req.body.email
    const password  = req.body.password

    var isLogin     = "Failed"
    var message     = ""
    var status      = 200
    var idUser      = 0

    db.query('SELECT * FROM users WHERE email = ? AND status = 1', email, async(err, rows, field)=>{
        if(!err) {
            if(rows.length>0)
            {
                const validPassword = await bcrypt.compare(password, rows[0].password)
                if (validPassword){
                    isLogin     = "Success"
                    message     = "Successfully Login"
                    idUser      = rows[0].id_user
                }else{
                    message     = "Failed Login! Password Wrong!"
                }
            }else{
                message     = "Failed Login! Email Not Found!"
            }
            res.status(status).json({data:{
                isLogin:isLogin,
                message:message,
                idUser:idUser
            }})
        }
    })
}

module.exports.register = async (req, res)=>{
    const email             = req.body.email
    const password          = req.body.password
    const password_confirm  = req.body.password_confirm
    
    const salt              = await bcrypt.genSalt(10)
    const new_password      = await bcrypt.hash(password, salt)

    var isRegistered        = "Failed"
    var message             = "Error Registered!"
    var status              = 200
    
    db.query('SELECT * FROM users WHERE email = ? AND status != -1', email, async(err, rows, field)=>{
        if(!err){
            if(rows.length==0){
                
                let returnData = await insertData([null, email, password, null, 1])
                    
                if(returnData == 1){
                    isRegistered    = "Success"
                    message         = "Successfully Registered! You can login now!"
                }
                
            }else{
                message = "Email Already Exist!"
            }
        }
        
        res.status(status).json({data:{
            isRegistered:isRegistered,
            message:message
        }})
    })
}

module.exports.forgot = (req, res)=>{
    db.query("SELECT * FROM messages", function(err, rows, fields){
        if(err) throw err

        res.status(200).json({data:rows})
    })
}

function insertData(data){
    return new Promise((resolve, reject) =>{
        db.query('INSERT INTO users(name, email, password, description, status) VALUES(?, ?, ?, ?, ?)', data, (err, rows, field)=>{
            if(err){
                reject(0)
            }else{
                resolve(1)
            }
        })
    })
}