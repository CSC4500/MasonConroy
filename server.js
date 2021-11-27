const express = require('express');
var con = require("./connection")
const app = express();

app.get('/players', (req, res)=>{
    con.query(
        "SELECT * FROM Players",
        (err,result)=>{
            if(err) throw err;
            console.log(result)
            res.send(result)
        }
    )
})

let port = 8080;
console.log(`listening on ${port}`)
app.listen(port)