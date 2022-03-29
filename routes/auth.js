const {Router}      = require("express")
const auth          = require("../controllers/auth")
const router        = Router()

router.post("/login", auth.login)

router.post("/register", auth.register)

router.post("/forgot", auth.forgot)

module.exports = router