const db = require("../libraries/db");

exports.postUserOrderDetails = async (rowFields) => {
    
    const {id, userId, createdAt, orderStatus, paymentStatus} = rowFields

    return db
    .raw(
      'insert into order_details (id,"userId","orderStatus","paymentStatus","createdAt",amount) select ?,?,?,?,?,sum(amount) from cart_details where "userId"=?',
      [id, userId, orderStatus, paymentStatus, createdAt, userId]
    )
    .then((result) => {
      return result.rowCount;
    })
    .catch((error) => console.log(error));

}

exports.getUserOrderDetails = async (userId) => {
    return db("order_details")
    .select("*")
    .where({userId})
    .then((result) => {
        result.rows
    })
    .catch((error) => console.log(error));
}
