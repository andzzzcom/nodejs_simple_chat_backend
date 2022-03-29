const {Router}      = require("express")
const auth          = require("./auth")
const profile       = require("./profile")
const chat          = require("./chat")

const router        = Router()

router.use("/auth", auth)
router.use("/profile", profile)
router.use("/chat", chat)

module.exports = router