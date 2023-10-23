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

exports.getUserOrderDetailsModel = async (queryField) => {
    return db("order_details")
    .select("*")
    .where(queryField)
    .then((result) => {
      return result;
    })
    .catch((error) => null);
}

exports.deleteOrder = async (queryField) => {
  return db("order_details")
    .where(queryField)
    .del()
    .then((result) => {
      console.log("result= " + result);
      return result;
    })
    .catch((error) => console.log(error));
};
