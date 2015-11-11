var UserModel = function() {
	
	var self = this;
	self.setTable("usuario");

	this.getResponsablesPorNinio = function(done) {
		self.getConnection().query("SELECT * FROM usuario", done);
	};

	this.login = function(user, password, done) {
		self.select(["id_usuario", "nombre_usu", "status_usu"], {
			nombre_usu : user,
			password_usu : password
		}, done);
	};

};

UserModel.prototype = require("./AbstractModel");

module.exports = new UserModel();
