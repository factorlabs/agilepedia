var express = require('express');
var layout = require('express-layout');
var path = require('path');
var app = express();
i18n = require("i18n");
var mongoose = require('mongoose');
var bodyParser= require('body-parser');

mongoose.connect('mongodb://localhost/agile');

app.use(bodyParser.urlencoded({extended: true}))


var problems = require('./routes/problems');
app.use('/problem', problems);

app.use(i18n.init);

i18n.configure({
    locales:['en', 'pl'],
    directory: __dirname + '/locales'
});

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');


app.listen(3000, function () {
  console.log('Example app listening on port 3000!');
});

module.exports = app