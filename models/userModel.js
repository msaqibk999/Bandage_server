const db = require("../libraries/db");

exports.getUserById = async (id) => {
  return db("users")
    .select("*")
    .where(id)
    .then((result) => {
      return result;
    })
    .catch((error) => {
      console.log(error);
    });
};

exports.setUserById = async (id, firstName, lastName, email, phone, image) => {
  return db("users")
    .where({ id })
    .update({
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      email: email,
      meta:{image}
    })
    .then((result) => result)
    .catch((error) => console.log(error));
};
