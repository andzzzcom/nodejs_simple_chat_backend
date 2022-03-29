const {Router}      = require("express")
const chat          = require("../controllers/chat")
const {jwtAuth}     = require("../middleware/jwtAuth")
const router        = Router()

/*
router.get("/chat", jwtAuth, chat.chat)
router.post("/insert_message", jwtAuth, chat.insertMessage)

router.get("/get_online_user", jwtAuth, chat.onlineUsers)
router.put("/update_user", jwtAuth, chat.updateUser)
*/

router.get("/chat", chat.chat)
router.post("/insert_message", chat.insertMessage)

router.get("/get_online_user", chat.onlineUsers)
router.put("/update_user", chat.updateUser)


module.exports = router