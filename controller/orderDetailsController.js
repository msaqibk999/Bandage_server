const orderDetailsModel = require('../models/orderDetailsModel')
const { v4: uuidv4 } = require("uuid");
const jwt_decode = require("jwt-decode")




exports.insertUserOrderDetail = async (req, res, next) => {
    const userId = req.user.id
    const id = uuidv4();
    const createdAt = Date.now();
    const rowFields = {
      id,
      userId,
      createdAt,
      orderStatus:"pending",
      paymentStatus:"pending"
    };
    const rowCount = await orderDetailsModel.postUserOrderDetails(rowFields);
    console.log("order inserted = "+rowCount)
    if (rowCount) {
        res.status(201).json({ status: "success", message: "order placed",id });
      }
     else {
      res.status(501).json({ status: "fail", message: "failed to place order" });
    }
  };

  exports.getUserOrderDetails = async (req, res, next) => {
    const userId = req.user.id;
    const orders = await orderDetailsModel.getUserOrderDetailsModel({userId});
    if(orders) {
      res.status(201).json({ status: "success", OrderData: orders})
    }
    else {
      res.status(501).json({status: "fail", message: "failed to get order details"})
    } 
  }

  exports.deleteUserOrder = async (req, res, next) => {
    const userId = req.user.id
    const {id} = req.body;
    const queryField= 
    {   id,
        userId
    }
    const rowCount = await orderDetailsModel.deleteOrder(queryField);
    console.log("rowCount= "+rowCount)
    if (rowCount) {
         res.status(201).json({ status: "success", message: "deleted from orders" });
      } else {
        res.status(501).json({ status: "fail", message: "failed to delete item" });
      }
}