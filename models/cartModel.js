const db = require("../libraries/db");

exports.addToCart = async (rowFields) => {

  const {userId, productId, quantity, createdAt,} = rowFields

  return db
    .raw(
      'insert into cart_details("userId","productId",amount,quantity,"createdAt") select ?,?,price,?,? from products where id=?',
      [userId, productId, quantity, createdAt, productId]
    )
    .then((result) => {
      return result.rowCount;
    })
    .catch((error) => {
      console.log("Error in adding to cart",error)
      return null;
    });
};

exports.getCartProducts = async (userId) => {
  return db
    .raw(
      'SELECT name,images,price,category,id,c.quantity FROM products p inner JOIN cart_details c on p.id=c."productId" where c."userId"=?',
      [userId]
    )
    .then((result) => {
      return result.rows;
    })
    .catch((error) => {
      console.log("Error in getting cart",error);
      return null;
    });
};

exports.deleteProductFromCart = async (queryField) => {
  return db("cart_details")
    .where(queryField)
    .del()
    .then((result) => {
      return result;
    })
    .catch((error) => {
      console.log("Error in deleting product from cart",error);
      return null;
    });
};

exports.deleteAllCart = async (queryField) => {
  return db("cart_details")
    .where(queryField)
    .del()
    .then((result) => {
      return result;
    })
    .catch((error) => {
      console.log("Error in deleting cart",error);
      return null;
    });
};

exports.updateQuantity = async (queryField) => {
  const quantity = queryField.quantity;
  const userId = queryField.userId;
  const productId = queryField.productId;

    db.raw(
      'update cart_details set amount = products.price*?, quantity=? from products where products.id=cart_details."productId" and cart_details."productId"=? and cart_details."userId"=?',
      [quantity, quantity, productId, userId]
    )
    .then((result) => {
      return result.rowCount;
    })
    .catch((error) => {
      console.log("Error in updating cart quantity",error)
      return null;
    });
};
