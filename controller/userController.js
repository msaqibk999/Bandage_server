const userModel = require('../models/userModel')

exports.getUserById = async(req, res, next) => {
    const id = req.user.id;
    console.log("id from verify= "+id)
    if(!id) res.status(501).json({ status: "failed", message: "empty id" });
    const data = await userModel.getUserById({id});
    if(data){
    res.status(201).json({ status: "success", data});
    }
    else{
    res.status(501).json({ status: "failed", message: "can't get user info" });
    }
 }

exports.updateUser = async(req, res, next) => {
    console.log("update user hitted !!!!")
    const id = req.user.id
    const {firstName, lastName, email, phone, image} = req.body
    const rowCount = await userModel.setUserById(id, firstName, lastName, email, phone, image);
    if (rowCount) {
         res.status(201).json({ status: "success", message: "updated user" });
      } else {
        res.status(501).json({ status: "fail", message: "failed to update user" });
      }

}