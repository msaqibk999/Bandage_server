const cartModel = require("../models/cartModel");

exports.insertIntoCart = async (req, res, next) => {
  try {
    const userId = req.user.id
    const { productId } = req.body;
    const createdAt = Date.now();
    const quantity = 1;
    const rowFields = {
      userId,
      productId,
      quantity,
      createdAt,
    };
    const rowCount = await cartModel.addToCart(rowFields);
    if (rowCount) {
      if (rowCount === -1) {
        res
          .status(501)
          .json({ status: "blocked", message: "item already exists" });
      } else {
        res.status(201).json({ status: "success", message: "added to cart" });
      }
    } else {
      res.status(501).json({ status: "fail", message: "failed to add item" });
    } } catch (error) {
      console.error("Error in insertIntoCart:", error);
      res.status(500).json({ status: "error", message: "Internal server error" });
    }
};

exports.getProductsFromCart = async (req, res, next) => {
  try{
    const userId = req.user.id;
    const cart = await cartModel.getCartProducts(userId);
    if (cart) {
      res.status(201).json({ status: "success", cart });
    }
    if (!cart) {
      res
        .status(501)
        .json({ status: "failed", message: "can't get product list" });
    }} catch (error) {
      console.error("Error in getProductsFromCart:", error);
      res.status(500).json({ status: "error", message: "Internal server error" });
    }
};

exports.deleteProduct = async (req, res, next) => {
    try{
      const userId = req.user.id
      const {productId} = req.body;
      const queryField= 
      {   productId,
          userId
      }
      const rowCount = await cartModel.deleteProductFromCart(queryField);
      if (rowCount) {
          res.status(201).json({ status: "success", message: "deleted from cart" });
        } else {
          res.status(501).json({ status: "fail", message: "failed to delete item" });
        }} catch (error) {
          console.error("Error in deleteProduct:", error);
          res.status(500).json({ status: "error", message: "Internal server error" });
        }
}

exports.updateQuantity = async (req, res, next) => {
    try{
      const userId = req.user.id
      const {productId,quantity} = req.body;
      const queryField = 
      {   productId,
          userId,
          quantity
      }
      const rowCount =  cartModel.updateQuantity(queryField);
      if (rowCount) {
          res.status(201).json({ status: "success", message: "updated quantity" });
        } else {
          res.status(501).json({ status: "fail", message: "failed to update quantity" });
        }} catch (error) {
          console.error("Error in updateQuantity:", error);
          res.status(500).json({ status: "error", message: "Internal server error" });
        }
}

exports.deleteCart = async (req, res, next) => {
    try{
      const userId = req.user.id;
      const rowCount = await cartModel.deleteAllCart({userId});
      if (rowCount) {
          res.status(201).json({ status: "success", message: "cart deleted" });
      } else {
        res.status(501).json({ status: "fail", message: "failed to delete cart" });
      }} catch (error) {
        console.error("Error in deleteCart:", error);
        res.status(500).json({ status: "error", message: "Internal server error" });
      }
}
