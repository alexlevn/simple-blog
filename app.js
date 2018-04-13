var express = require('express');
var config = require('config');
var bodyParser = require('body-parser');
var session = require("express-session");

var app = express();

var socketio = require('socket.io');

// app.use(bodyParser.json());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

app.use(session({
    secret: config.get("secret_key"),
    resave: false,
    saveUninitialized: true,
    cookie: {secure: false}
    // => để có thể set dữ liệu khác vào. không biết quy trình này có đúng không.
}));


app.set("views", __dirname + "/apps/views");
app.set("view engine", "ejs");
app.use("/static", express.static(__dirname + "/public"));

var controllers = require(__dirname + "/apps/controllers");

app.use(controllers);

var host = config.get("server.host");
var port = config.get("server.port");


var server = app.listen(port, function(){
    console.log('Server is running on port:', port);
});

var io = socketio(server);

var socketcontrol = require('./apps/common/socketcontrol')(io);