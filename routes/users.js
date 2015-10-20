var express = require('express'),
	router = express.Router(),
	userController = require("./../database/controllers/UserController");

/* GET users listing. */
router.get('/', function(req, res, next) {
  
  /*userController.insert({
  	nombre_usu : "nombre"
  }, function(err, data) {
  	console.log(err, data);
  	res.send(data);
  });

  userController.update({
  	nombre_usu : "--.edkwen"
  },{
  	id_usuario : 6
  }, function(err, data) {
  	console.log(err, data);
  	res.send(data);
  });

  userController.select(["nombre_usu"],{
  }, function(err, data) {
  	console.log(err, data);
  	res.send(data);
  });

  userController.delete({
  	id_usuario : 6
  }, function(err, data) {
  	console.log(err, data);
  	res.send(data);
  });

  userController.getResponsablesPorNinio(function(err, data) {
  	console.log(err, data);
  	res.send(data);
  });*/

	res.render("users");

});

router.get('/o', function(req, res) {
	res.render("users/opciones");
});

router.get('/showUsers', function(req, res) {
	res.render("users/showUsers");
});

router.get('/getUsers', function(req, res) {
	userController.select(["id_usuario","nombre_usu", "status_usu"],{
	}, function(err, data) {
		res.send(data);
	});
});

router.get('/getUser/:id', function(req, res) {
	userController.select(["id_usuario","nombre_usu", "status_usu"],{
		id_usuario : req.params.id
	}, function(err, data) {
		res.send(data);
	});
});

router.post('/create', function(req, res) {
	try {
		jsonUser = req.body.data.user;
		userController.insert(jsonUser, function(err, data) {
			console.log(err, data);
			res.send(data);
		});
	} catch(e) {
		res.send({error : "not found: " + e.message});
	}
});

router.put('/update', function(req, res) {
	/*{
		data : {
			id : 5,
			user : {}
		}
	}*/
	try {
		jsonUser = req.body.data.user;
		id = req.body.data.id;
		userController.update(jsonUser, {
			id_usuario : id
		}, function(err, data) {
			console.log(err, data);
			res.send(data);
		});
	} catch(e) {
		res.send({error : "not found: " + e.message});
	}
});

router.delete('/delete/:id', function(req, res) {
	try {
		userController.delete({
			id_usuario : req.params.id
		}, function(err, data) {
			console.log(err, data);
			res.send(data);
		});
	} catch(e) {
		res.send({error : "not found: " + e.message});
	}
});

module.exports = router;
