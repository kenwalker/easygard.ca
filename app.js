/*jshint node:true*/

var port = (process.env.VCAP_APP_PORT || 3000);
var express = require('express');
var app = express();

app.use(express.static(__dirname + '/')); // Serve files from the root

app.listen(port);	
console.log('Node server listening on ' + port);

