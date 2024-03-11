const db = require("../libraries/db");

exports.getAllProducts = async () => {
    return db("products")
    .select("*")
    .then((result) => {
      return result;
    })
    .catch((error) => {
        console.log("Error in getting products list",error);
        return null;
    });
}

exports.getProductById = async (id) => {
    
    return db("products")
    .select("*")
    .where({id})
    .then((result) => {
        return result;
    })
    .catch((error) => {
        console.log("Error in getting product",error);
        return null;
    });
}