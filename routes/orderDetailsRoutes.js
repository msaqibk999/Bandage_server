const orderDetailsController = require('../controller/orderDetailsController')
const verifyTokenController = require('../middleware/verifyToken')
const express = require("express");
const router = express.Router();

router.get("/place",verifyTokenController.verifyToken,orderDetailsController.insertUserOrderDetail)


module.exports = router;