const orderDetailsController = require('../controller/orderDetailsController')
const verifyTokenController = require('../middleware/verifyToken')
const express = require("express");
const router = express.Router();

router.post("/place",verifyTokenController.verifyToken,orderDetailsController.insertUserOrderDetail)
router.get("/get",verifyTokenController.verifyToken,orderDetailsController.getUserOrderDetails)
router.post("/delete",verifyTokenController.verifyToken,orderDetailsController.deleteUserOrder)



module.exports = router;