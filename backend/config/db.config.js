"use strict";
const mysql = require('mysql');

const connection = mysql.createConnection({
    host: "192.168.0.73",
    user: "navid",
    password: "navid7373",
    database: "Axxes",
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
