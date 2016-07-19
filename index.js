var express = require('express')
  , layout = require('express-layout')
  , path = require('path')
  , app = express()
  , i18n = require("i18n")
  , mongoose = require('mongoose')
  , bodyParser = require('body-parser')
  , mongodbConfig = require('./config/mongodb'); 



mongoose.connect(mongodbConfig.mongoURI[app.settings.env]);

app.use(bodyParser.urlencoded({extended: true}))
app.use(i18n.init);

i18n.configure({
    locales:['en', 'pl'],
    directory: __dirname + '/locales'
});

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

var problems = require('./routes/problems');
app.use('/problem', problems);

app.listen(3000, function () {
  console.log('Example app listening on port 3000!');
});

module.exports = app