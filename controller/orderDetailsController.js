const orderDetailsModel = require('../models/orderDetailsModel')
const { v4: uuidv4 } = require("uuid");

exports.insertUserOrderDetail = async (req, res, next) => {
    try{
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
      if (rowCount) {
          res.status(201).json({ status: "success", message: "order placed",id });
        }
      else {
        res.status(501).json({ status: "fail", message: "failed to place order" });
      }} catch (error) {
        console.error("Error in insertUserOrderDetail:", error);
        res.status(500).json({ status: "error", message: "Internal server error" });
      }
  };

  exports.getUserOrderDetails = async (req, res, next) => {
    try{
      const userId = req.user.id;
      const orders = await orderDetailsModel.getUserOrderDetailsModel({userId});
      if(orders) {
        res.status(201).json({ status: "success", OrderData: orders})
      }
      else {
        res.status(501).json({status: "fail", message: "failed to get order details"})
      }} catch (error) {
        console.error("Error in getUserOrderDetails:", error);
        res.status(500).json({ status: "error", message: "Internal server error" });
      }
  }

  exports.deleteUserOrder = async (req, res, next) => {
    try{
      const userId = req.user.id
      const {id} = req.body;
      const queryField= 
      {   id,
          userId
      }
      const rowCount = await orderDetailsModel.deleteOrder(queryField);
      if (rowCount) {
          res.status(201).json({ status: "success", message: "deleted from orders" });
        } else {
          res.status(501).json({ status: "fail", message: "failed to delete item" });
        }} catch (error) {
          console.error("Error in deleteUserOrder:", error);
          res.status(500).json({ status: "error", message: "Internal server error" });
        }
}