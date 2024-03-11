const db = require("../libraries/db");

exports.saveUserDetails = (rowFields) => {
  return db("users")
    .insert(rowFields)
    .then((result) => result.rowCount)
    .catch((error) => {
      console.log("Error in saving user",error);
      return null;
    });
};

exports.getUser = (queryField) => {
  return db("users")
    .select("id", "password")
    .where(queryField)
    .then((result) => {
      return result;
    })
    .catch((error) => {
      console.log("Error in getting user",error);
      return null;
    });
};

exports.insertAuth = (email, passwordHash) => {
  return db("auth")
    .insert({
      email,
      password: passwordHash,
    })
    .then((result) => result.rowCount)
    .catch((error) => {
      console.log("Error in inserting user auth",error);
      return null;
    });
};
