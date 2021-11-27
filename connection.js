var mysql = require('mysql');
var pass = require('./passwd')

var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: pass,
    database: "recruiting_db"
})

con.connect(function(err){
    if (err) throw err;
    console.log("Connected!")
});

module.exports = con