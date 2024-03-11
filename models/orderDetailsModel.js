const db = require("../libraries/db");

exports.postUserOrderDetails = async (rowFields) => {
  const { id, userId, createdAt, orderStatus, paymentStatus } = rowFields;

  try {
    const result = await db.raw(`
        WITH order_meta AS (
          SELECT jsonb_build_object('products', jsonb_agg(cart."productId")) AS meta
          FROM cart_details cart
          WHERE cart."userId" = ?
        ),
        order_amount AS (
          SELECT SUM(cart.amount) AS total_amount
          FROM cart_details cart
          WHERE cart."userId" = ?
        )
        INSERT INTO order_details (id, "userId", "orderStatus", "paymentStatus", "createdAt", amount, meta)
        SELECT ?, ?, ?, ?, ?, (oa.total_amount * 1.05), (SELECT meta FROM order_meta)
        FROM order_amount oa
    `, [userId, userId, id, userId, orderStatus, paymentStatus, createdAt]);

    return result.rowCount;
  } catch (error) {
    console.error('Error in posting user details:', error);
    throw error;
  }
};



exports.getUserOrderDetailsModel = async (queryField) => {
  try {
      const orderDetails = await db("order_details")
          .select("*")
          .where(queryField);

      const orderDetailsWithImages = await Promise.all(orderDetails.map(async (order) => {
          if (order.meta && order.meta.products && order.meta.products.length > 0) {
              const productInfo = [];
              for (const productId of order.meta.products) {
                  const product = await db("products")
                      .select("name", "images")
                      .where("id", productId)
                      .first();
                  if (product && product.images && product.images.length > 0) {
                      productInfo.push({
                        image: product.images[0],
                        name: product.name,
                      });
                  }
              }
              order.meta.productInfo = productInfo;
          }
          return order;
      }));

      return orderDetailsWithImages;
  } catch (error) {
      console.error("Error in getting user's orders:", error);
      return null;
  }
}


exports.deleteOrder = async (queryField) => {
  return db("order_details")
    .where(queryField)
    .del()
    .then((result) => {
      console.log("result= " + result);
      return result;
    })
    .catch((error) => {
      console.log("Error in Deleting order",error);
      return null;
    });
};
