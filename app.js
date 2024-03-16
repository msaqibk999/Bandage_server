const cluster = require('cluster');
const os = require('os');
const express = require('express');
const dotenv=require('dotenv')
const morgan= require('morgan')
const cors = require("cors");
const routes = require("./routes/index");
const https = require('https');


dotenv.config({ path: './config.env' });

const totalCpus = os.cpus().length;

    if(cluster.isPrimary){
        for(let i = 0; i < totalCpus; i++){
            cluster.fork();
        }
      } else{
            
            const app = express();
            const allowedOrigins = process.env.ALLOWED_ORIGINS
                                   ? process.env.ALLOWED_ORIGINS.split(',')
                                   : [];
            app.use(cors({ origin: allowedOrigins }));
            app.use(morgan("dev"))
            app.use(express.json());

            app.get('/', (req, res) => {
            res.status(200).json({ status: 'OK', message: `Health check passed ${process.pid}` });
            });

            app.use("/", routes);

            setInterval(() => {
            https.get(process.env.base_url);
            },5 * 60 * 1000);

            const port = 4000;
            app.listen(port, () => console.log(`server listening at port ${port}`));

          }