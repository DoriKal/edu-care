var passport = require("passport"),
    LocalStrategy = require("passport-local").Strategy,
    userController = require("./database/controllers/UserController"),
    encriptacion = require("./util/encriptation");

passport.use(new LocalStrategy(function(username, password, done) {
  userController.login(encriptacion.cipher(username), encriptacion.cipher(password), function(err, usuario) {
    done(null, (usuario && usuario.length==1) ? usuario[0] : {errLogin : true});
  });
}));

passport.serializeUser(function(user, done) {
  done(null, user);
});

passport.deserializeUser(function(user, done) {
  done(null, user);
});

module.exports = passport;
