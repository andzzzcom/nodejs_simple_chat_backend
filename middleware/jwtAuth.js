const jwt	= require('jsonwebtoken');

const jwtAuth = (req, res, next)=>{
	
    const authHeader = req.headers.authorization;

    if (authHeader) {
        const jwtToken = authHeader.split(' ')[1];

        jwt.verify(jwtToken, process.env.JWT_SECRET, (err, decodedToken) => {
            if (err) {
				console.log(err);
				return res.sendStatus(401);
            }
            next();
        });
    } else {
		return res.sendStatus(401);
    }
}

module.exports = { jwtAuth }