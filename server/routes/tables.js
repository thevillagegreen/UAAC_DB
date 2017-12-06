
var express = require('express');
const knex = require('../db/knex');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('tables', { title: 'UAAC' });
});

router.get('/newest', function(req, res) {
  knex('NEWEST_ANIMAL').orderBy('Date_In', 'DESC')
    .select()
    .then(newest => {
      res.render('./tables/newest', {newest: newest});
    })
});

router.get('/animal', function(req, res) {
  knex('ANIMAL')
    .select()
    .then(animals => {
      res.render('./tables/animal', {animals: animals});
    })
});

router.get('/animal/new', function(req, res) {
  res.render('./animal/insert');
});

router.post('/animal/new', function(req, res) {
  console.log(req.body);
  knex('ANIMAL').insert(
    {
      Animal_ID: req.body.id,
      Animal_Name: req.body.name,
      Breed: req.body.breed
    }).then(a => {
      console.log('post sent');
      console.log(a);
      res.redirect('/tables/animal');
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
