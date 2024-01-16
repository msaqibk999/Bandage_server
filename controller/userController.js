const userModel = require('../models/userModel')

exports.getUserById = async(req, res, next) => {
    try{
      const id = req.user.id;
      if(!id) res.status(501).json({ status: "failed", message: "empty id" });
      const data = await userModel.getUserById({id});
      if(data){
      res.status(201).json({ status: "success", data});
      }
      else{
      res.status(501).json({ status: "failed", message: "can't get user info" });
      }} catch (error) {
        console.error("Error in getUserById:", error);
        res.status(500).json({ status: "error", message: "Internal server error" });
      }
 }

exports.updateUser = async(req, res, next) => {
    try{
      const id = req.user.id
      const {firstName, lastName, email, phone, image} = req.body
      const rowCount = await userModel.setUserById(id, firstName, lastName, email, phone, image);
      if (rowCount) {
          res.status(201).json({ status: "success", message: "updated user" });
        } else {
          res.status(501).json({ status: "fail", message: "failed to update user" });
        }} catch (error) {
          console.error("Error in updateUser:", error);
          res.status(500).json({ status: "error", message: "Internal server error" });
        }

}