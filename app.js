const express = require("express");
const dotenv=require('dotenv')
const morgan= require('morgan')
const cors = require("cors");
const routes = require("./routes/index");
dotenv.config({ path: './config.env' });

const app = express();
const allowedOrigins = process.env.ALLOWED_ORIGINS
  ? process.env.ALLOWED_ORIGINS.split(',')
  : [];
app.use(cors({ origin: allowedOrigins }));
app.use(morgan("dev"))
app.use(express.json());

app.get('/', (req, res) => {
  res.status(200).json({ status: 'OK', message: 'Health check passed' });
});

app.use("/", routes);


const port = 4000;



app.listen(port, () => console.log(`server listening at port ${port}....`));
