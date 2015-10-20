educareModule.controller("UsersController", ["$scope", "$http", "$routeParams", "$location", function($scope, $http, $routeParams, $location) {

	$scope.users = [];
	$scope.user = {};
	$scope.opciones = {
		create : true
	};

	$scope.getUsers = function() {
		$http.get("/users/getUsers").success(function(users) {
			$scope.users = users;
		});
	};

	$scope.deleteUser = function(user_id) {
		if(confirm("¿Esta seguro de eliminar?")) {
			$http.delete("/users/delete/" + user_id).success(function(data) {
				if(data.affectedRows === 1) {
					$scope.getUsers();
				}
			});
		}
	};

	$scope.setDataUser = function(user_id) {
		if($routeParams.id) {
			$scope.user = $scope.getById($routeParams.id, $scope.setUser);
			$scope.opciones.create = false;
		}
	}

	$scope.setUser = function(user) {
		$scope.user = user;
	};

	$scope.opcAccionUser = function(){
		if($scope.opciones.create) {
			data = {
				user : $scope.user
			};
			$http.post("/users/create", {data : data}).success(function(data) {
				if(data.affectedRows === 1) {
					$scope.user = {};
				}
			});
		} else {
			data = {
				user : $scope.user,
				id   : $scope.user.id_usuario
			};
			$http.put("/users/update", {data : data}).success(function(data) {
				if(data.affectedRows === 1) {
					$scope.user = {};
				}
			});
		}
		$location.path("/");
	}

	$scope.getById = function(user_id, done) {
		$http.get("/users/getUser/" + user_id).success(function(usuarios) {
			done(usuarios[0]);
		});
	}

}]);