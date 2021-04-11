"use strict";
const mysql = require('mysql');

const connection = mysql.createConnection({
    host: "127.0.0.1",
    user: "navid",
    password: "navid7373",
    database: "axxes",
    port: 3306
});

connection.connect(function (err) {
    if (err) {
        console.error('error connecting: ' + err.stack);
        return;
    }

    console.log('connected as id ' + connection.threadId);
});

module.exports = connection;
