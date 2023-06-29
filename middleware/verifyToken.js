const userModel = require("../models/userModel");
const jwt = require("jsonwebtoken");
const JWT_SECRET = "hflakhfahakfva";

exports.verifyToken = async (req, res, next) => {
    req.user={}
  const token = req.headers.token;
  if (!token) {
    res.status(400).json({ status: "Blocked", message: "Empty Token" });
    return;
  }
  let userId;

  jwt.verify(token, JWT_SECRET, (err, payload) => {
    if(err) {
        // console.log(err)
        res.status(400).json({ status: "Blocked", message: "Invalid Token" });
    }
    else userId=payload.id
  });
 
  if(!userId) return    
  const user = await userModel.getUserById({ id: userId }).then((res) => res[0]);
  req.user=user
  if (!user)
    res.status(400).json({ status: "Blocked", message: "user not exists" });
  
  return next();

};
