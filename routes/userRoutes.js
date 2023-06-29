const userController = require('../controller/userController')
const verifyTokenController = require("../middleware/verifyToken")
const express = require("express");
const router = express.Router();

router.get('/get-by-id',verifyTokenController.verifyToken,userController.getUserById)
router.post('/update',verifyTokenController.verifyToken,userController.updateUser)
router.get('/check',verifyTokenController.verifyToken)

module.exports = router;