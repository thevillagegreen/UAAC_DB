var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'UAAC' });
});

router.get('/donate', function(req, res, next) {
  res.render('donate', { title: 'UAAC' });
});

module.exports = router;
