const express = require('express');
const app = express();
const bodyParser = require('body-parser');
app.use(bodyParser.json())
const knexObject = require('knex');
const pg = require('pg');
require('dotenv').config();


pg.types.setTypeParser(20, Number)

const knexConfig = {
    client: 'postgresql',
    connection: {
        connectionString: process.env.DATABASE_URL,
        ssl: { rejectUnauthorized: false },
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

