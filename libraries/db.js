const express = require('express');
const app = express();
const bodyParser = require('body-parser');
app.use(bodyParser.json())
const knexObject = require('knex');
const pg = require('pg');


pg.types.setTypeParser(20, Number)

const knexConfig = {
    client: 'postgresql',
    connection: {
        connectionString: process.env.DATABASE_URL || 'postgres://saqib:eZiWQ991cIi34pbbqqf1DfpJ2MrL1wc9@dpg-cmii1nf109ks739m1sn0-a.oregon-postgres.render.com:5432/bandage_dump',
        ssl: { rejectUnauthorized: false }, // add this if you're using SSL
    },
    pool: {
        min: 2,
        max: 10,
        idleTimeoutMillis: 2000,
        reapIntervalMillis: 1000,
    },
};


const db = knexObject(knexConfig);
db.raw('SELECT 1')
    .then(() => console.log('Connected to PostgreSQL'))
    .catch(err => console.error('Error connecting to PostgreSQL:', err));

module.exports = db;

