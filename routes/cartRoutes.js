const cartController = require('../controller/cartController')
const verifyTokenController = require('../middleware/verifyToken')
const express = require("express");
const router = express.Router();

router.post('/add-to-cart',verifyTokenController.verifyToken,cartController.insertIntoCart)
router.get('/get-cart',verifyTokenController.verifyToken,cartController.getProductsFromCart)
router.post("/delete-product",verifyTokenController.verifyToken,cartController.deleteProduct)
router.post("/update-quantity",verifyTokenController.verifyToken,cartController.updateQuantity)
router.get("/delete-cart",verifyTokenController.verifyToken,cartController.deleteCart)

module.exports = router;