const productModel = require('../models/productModel')

exports.getProductList = async function (req,res) {
       try{
            const products = await productModel.getAllProducts();
            if(products){
            res.status(201).json({ status: "success", products });
            }
            if(!products){
            res.status(501).json({status:"failed",message:"can't get product list"})
            }} catch (error) {
                console.error("Error in getProductList:", error);
                res.status(500).json({ status: "error", message: "Internal server error" });
              }
    }

exports.getProductById = async function (req,res) {
       try{
        const id = req.params.id;
        const product = await productModel.getProductById(id);
        res.status(201).json({ status: "success", product});
        } catch (error) {
            console.error("Error in getProductById:", error);
            res.status(500).json({ status: "error", message: "Internal server error" });
          }
    }

 
 
