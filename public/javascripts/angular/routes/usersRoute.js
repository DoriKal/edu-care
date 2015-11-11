educare.config(["$routeProvider", function($routeProvider) {
	$routeProvider.
	when("/", {templateUrl : "/users/showUsers"}).
	when("/o/create/", {templateUrl : "/users/o", controller : "UsersController"}).
	when("/o/update/:id", {templateUrl : "/users/o", controller : "UsersController"}).
	otherwise({redirectTo : "/"});
}]);