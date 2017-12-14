
var express = require('express');
const knex = require('../db/knex');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('tables', { title: 'UAAC' });
});

/***
Newest animal page
*/
router.get('/newest', function(req, res) {
  knex('NEWEST_ANIMAL').orderBy('Date_In', 'DESC').limit('10')
    .select()
    .then(newest => {
      res.render('./tables/newest', {newest: newest});
    })
});

/***
Animal routes
*/
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

router.get('/animal/search/result', function(req, res) {
  knex('ANIMAL')
    .select()
    .where('Breed', search)
    .then(search => {
      res.render('./tables/animal/result', {search: search});
    })
});

router.post('/animal/search', function(req, res) {
  console.log('post sent');
  var search = req.body.breed;
  console.log(search);
  knex('ANIMAL')
    .select()
    .where('Breed', search)
    .then(search => {
      res.render('./animal/result', {search: search});
    })
});
/***
End Animal routes
*/


/***
Employee routes
*/
router.get('/employee', function(req, res) {
  knex('EMPLOYEE')
    .select()
    .then(employees => {
      res.render('./tables/employee', {employees: employees});
    })
});

//INSERT
router.get('/employee/new', function(req, res) {
  res.render('./employee/form');
});

router.post('/employee/new', function(req, res) {
  console.log(req.body);
  knex('EMPLOYEE').insert(
    {
      Employee_ID: req.body.id,
    	Lname: req.body.lname,
    	Fname: req.body.fname,
    	Mname: req.body.mname,
    	Address: req.body.address,
    	Phone_Number: req.body.number,
    	SSN: req.body.ssn,
    	Org_ID: req.body.org,
    }).then(a => {
      console.log('post sent');
      console.log(a);
      res.redirect('/tables/employee');
    })
});

//DELETE
router.get('/employee/delete', function(req, res) {
  res.render('./employee/delete');
});

router.post('/employee/delete', function(req, res) {
  console.log(req.body);
  knex('EMPLOYEE')
    .select()
    .where('Employee_ID', req.body.id)
    .del().then(a => {
      console.log('post sent');
      console.log(a);
      res.redirect('/tables/employee');
    })
});

//SEARCH DOESN'T DO ANYTHING
router.get('/employee/search', function(req, res) {
  res.render('./employee/search');
});

router.get('/employee/search/result', function(req, res) {
  knex('EMPLOYEE')
    .select()
    .where('Fname', search)
    .then(search => {
      res.render('./tables/employee/result', {search: search});
    })
});

router.post('/employee/search', function(req, res) {
  console.log('post sent');
  var search = req.body.fname;
  console.log(search);
  knex('EMPLOYEE')
    .select()
    .where('Fname', search)
    .then(search => {
      res.render('./employee/result', {search: search});
    })
});
/***
End Employee routes
*/


/***
Volunteer routes
*/
router.get('/volunteer', function(req, res) {
  knex('VOLUNTEER')
    .select()
    .then(volunteers => {
      res.render('./tables/volunteer', {volunteers: volunteers});
    })
});

//INSERT
router.get('/volunteer/new', function(req, res) {
  res.render('./volunteer/form');
});

router.post('/volunteer/new', function(req, res) {
  console.log(req.body);
  knex('VOLUNTEER').insert(
    {
      Volunteer_ID: req.body.id,
    	Lname: req.body.lname,
    	Fname: req.body.fname,
      Phone_Number: req.body.number,
    	Address: req.body.address,
    	Emergency_Contact_Lname: req.body.contact_last,
      Emergency_Contact_Fname: req.body.contact_first,
      Emergency_Contact_Pnumber: req.body.contact_number,
    	Org_ID: req.body.org,
    }).then(a => {
      console.log('post sent');
      console.log(a);
      res.redirect('/tables/volunteer');
    })
});

//DELETE
router.get('/volunteer/delete', function(req, res) {
  res.render('./volunteer/delete');
});

router.post('/volunteer/delete', function(req, res) {
  console.log(req.body);
  knex('VOLUNTEER')
    .select()
    .where('Volunteer_ID', req.body.id)
    .del().then(a => {
      console.log('post sent');
      console.log(a);
      res.redirect('/tables/volunteer');
    })
});

//SEARCH
router.get('/volunteer/search', function(req, res) {
  res.render('./volunteer/search');
});

router.post('/volunteer/search', function(req, res) {
  console.log(req.body);
  knex('VOLUNTEER')
    .where('FName', req.body.id)
  .then(a => {
    console.log('post sent');
    console.log(a);
    res.redirect('/tables/employee/result', {bree});  // Problem here
    })
});
/***
End Volunteer routes
*/


/***
Animal_health routes
*/
router.get('/animal_health', function(req, res) {
  knex('ANIMAL')    // check this shit
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
/***
End Animal_health routes
*/


/***
Adoptable animals routes
*/

//Available animals
router.get('/available_animal', function(req, res) {
  knex("ANIMAL")
    .join("ANIMAL_HEALTH", "ANIMAL.Animal_ID", "=", "ANIMAL_HEALTH.Animal_ID")
    .orderBy("Animal_Type", "ASC")
    .select("ANIMAL.Animal_ID", "Animal_Name", "Breed", "Animal_Type", "Spayed_Or_Neutered")
    .then(available => {
      res.render('./tables/available_animal', {available: available});
    })
});

//Available dogs
router.get('/available_dog', function(req, res) {
  knex("ANIMAL")
    .whereIn("Animal_Type", ["Dog", "dog"])
    .join("ANIMAL_HEALTH", "ANIMAL.Animal_ID", "=", "ANIMAL_HEALTH.Animal_ID")
    .select("ANIMAL.Animal_ID", "Animal_Name", "Breed", "Spayed_Or_Neutered")
    .then(available => {
      res.render('./tables/available_dog', {available: available});
    })
});

//Available cats
router.get('/available_cat', function(req, res) {
  knex("ANIMAL")
    .whereIn("Animal_Type", ["Cat", "cat"])
    .join("ANIMAL_HEALTH", "ANIMAL.Animal_ID", "=", "ANIMAL_HEALTH.Animal_ID")
    .select("ANIMAL.Animal_ID", "Animal_Name", "Breed", "Spayed_Or_Neutered")
    .then(available => {
      res.render('./tables/available_cat', {available: available});
    })
});


//INSERT
router.get('/volunteer/new', function(req, res) {
  res.render('./volunteer/form');
});



module.exports = router;
