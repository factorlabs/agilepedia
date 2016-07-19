var express = require('express');
var router = express.Router();
//var bodyParser = require('body-parser');
var Node = require("../models/node");

//express.use(bodyParser.urlencoded({ extended: true }));

router.get('/new', function (req, res) {
  res.render('problem/new', { title: 'Hey', message: 'Hello there!' });
});

router.post('/', function (req, res) {
  var problem = new Node({
    name: req.body.subject,
    body: req.body.problem,
    authorName: req.body.name,
    authorEmail: req.body.email
  });
  problem.save(function(err) {
    if (err) throw err;
    res.redirect('/problem/confirm');
  });
});

router.get('/confirm', function (req, res) {
  res.render('problem/confirm', { title: 'Hey', message: 'Hello there!' });
});

module.exports = router;