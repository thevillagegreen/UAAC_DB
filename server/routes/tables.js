
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

//INSERT

router.get('/animal/new', function(req, res) {
  res.render('./animal/form');
});

router.post('/animal/new', function(req, res) {
  console.log(req.body);
  knex('ANIMAL').insert(
    {
      Animal_ID: req.body.id,
      Animal_Name: req.body.name,
      Breed: req.body.breed,
      Age: req.body.age,
      Fur_Color: req.body.fur,
      Adopted: req.body.adopted,
      Animal_Folder: req.body.folder,
      Fostered: req.body.fostered,
      Animal_Type: req.body.type,
      Org_ID: req.body.org,
      Date_In: '2017-10-31 00:00:0000'

    }).then(a => {
      console.log('post sent');
      console.log(a);
      res.redirect('/tables/animal');
    })
});

//DELETE

router.get('/animal/delete', function(req, res) {
  res.render('./animal/delete');
});

router.post('/animal/delete', function(req, res) {
  console.log(req.body);
  knex('ANIMAL')
    .select()
    .where('Animal_ID', req.body.id)
    .del().then(a => {
      console.log('post sent');
      console.log(a);
      res.redirect('/tables/animal');
    })
});

//SEARCH

router.get('/animal/search', function(req, res) {
  res.render('./animal/search');
});


router.post('/animal/search', function(req, res) {
  console.log(req.body);
  knex('ANIMAL')
    .where('Animal_ID', req.body.id)
  .then(a => {
    console.log('post sent');
    console.log(a);
    res.redirect('/tables/animal/result', {bree});
    })
});




router.get('/employee', function(req, res) {
  knex('EMPLOYEE')
    .select()
    .then(employees => {
      res.render('./tables/employee', {employees: employees});
    })
});

router.get('/volunteer', function(req, res) {
  knex('VOLUNTEER')
    .select()
    .then(volunteers => {
      res.render('./tables/volunteer', {volunteers: volunteers});
    })
});

router.get('/animal_health', function(req, res) {
  knex('VOLUNTEER')
    .select()
    .then(animals => {
      res.render('./tables/animal_health', {animals: animals});
    })
});

router.get('/adopt', function(req, res) {
  knex.select("Animal_Name", "Breed", "Age").from("ANIMAL").where({Adopted:'No'})
    .then(adopt => {
      res.render('./tables/adopt', {adopt: adopt});
    })
});

module.exports = router;
