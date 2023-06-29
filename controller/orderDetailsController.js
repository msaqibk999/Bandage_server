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