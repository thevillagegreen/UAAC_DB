var express = require('express');
var router = express.Router();

const knex = require('../db/knex');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('tables', { title: 'Express' });
});

router.get('/animal', function(req, res) {
  knex('ANIMAL')
    .select()
    .then(animals => {
      res.render('./tables/animal', {animals: animals});
    })
});

router.get('/employee', function(req, res) {
  knex('EMPLOYEE')
    .select()
    .then(employees => {
      res.render('./tables/employee', {employees: employees});
    })
});

router.get('/adopt', function(req, res) {
  knex.select("Animal_Name", "Breed", "Age").from("ANIMAL").where({Adopted:'No'})
    .then(adopt => {
      res.render('./tables/adopt', {adopt: adopt});
    })
});

module.exports = router;
