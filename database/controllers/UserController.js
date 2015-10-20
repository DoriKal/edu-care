var UserController = function() {
	
	var self = this;
	self.model = require("../models/UserModel");

	this.getResponsablesPorNinio = function(done) {
		self.model.getResponsablesPorNinio(done);
	};

};

UserController.prototype = require("./AbstractController");

module.exports = new UserController();