var UserModel = function() {
	
	this.setTable("usuario");

	this.getResponsablesPorNinio = function(done) {
		this.getConnection().query("SELECT * FROM usuario", done);
	};

};

UserModel.prototype = require("./AbstractModel");

module.exports = new UserModel();
