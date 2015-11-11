var UserController = function() {
	
	var self = this;
	self.model = require("../models/UserModel");

	this.login = function(user, password, done) {
		self.model.login(user, password, done);
	};

	this.getResponsablesPorNinio = function(done) {
		self.model.getResponsablesPorNinio(done);
	};

};

UserController.prototype = require("./AbstractController");

module.exports = new UserController();