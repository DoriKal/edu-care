var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res) {
	if(!req.user) {
		res.render('login', { title: 'Educare | Login' });
	} else {
		res.render('index/', { title: 'Educare' });
	}
});

router.get("/logout", function(req, res) {
	req.session.destroy(function (){
		req.logout();
		res.redirect("/");
	});
});

module.exports = router;
