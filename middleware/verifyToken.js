const userModel = require("../models/userModel");
const jwt = require("jsonwebtoken");
require('dotenv').config();
const JWT_SECRET = process.env.JWT_SECRET;

exports.verifyToken = async (req, res, next) => {
  try {
    req.user = {};
    const token = req.headers.token;
    
    if (!token) {
      return res.status(400).json({ status: "Blocked", message: "Empty Token" });
    }

    let userId;

    jwt.verify(token, JWT_SECRET, (err, payload) => {
      if (err) {
        console.error("Error verifying token:", err);
        return res.status(400).json({ status: "Blocked", message: "Invalid Token" });
      }
      userId = payload.id;
    });

    if (!userId) return res.status(400).json({ status: "Blocked", message: "Invalid Token" });

    const user = await userModel.getUserById({ id: userId });
    
    if (!user || !user[0]) {
      return res.status(400).json({ status: "Blocked", message: "User does not exist" });
    }
    
    req.user = user[0];
    return next();
  } catch (error) {
    console.error("Error in verifyToken middleware:", error);
    return res.status(500).json({ status: "Blocked", message: "Internal Server Error" });
  }
};
