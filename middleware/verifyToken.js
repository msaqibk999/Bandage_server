const userModel = require("../models/userModel");
const jwt = require("jsonwebtoken");
require('dotenv').config();
const JWT_SECRET = process.env.JWT_SECRET;

exports.verifyToken = async (req, res, next) => {
  try {
    req.user = {};
    const token = req.headers.token;
    
    if (!token) {
      throw new Error("Empty Token");
    }

    let userId;

    jwt.verify(token, JWT_SECRET, (err, payload) => {
      if (err) {
        console.error("Error verifying token:", err);
        throw new Error("Invalid Token");
      }
      userId = payload.id;
    });

    if (!userId) {
      throw new Error("Invalid Token");
    }

    const user = await userModel.getUserById({ id: userId });
    
    if (!user || !user[0]) {
      throw new Error("User does not exist");
    }
    
    req.user = user[0];
    return next();
  } catch (error) {
    console.error("Error in verifyToken middleware:", error.message);
    let statusCode = 500;
    if (error.message === "Empty Token" || error.message === "Invalid Token") {
      statusCode = 400;
    }
    return res.status(statusCode).json({ status: "Blocked", message: error.message });
  }
};