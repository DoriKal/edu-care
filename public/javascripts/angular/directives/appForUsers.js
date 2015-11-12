educare.directive("appForUsers", [function() {
	return {
		restrict : "E",
		transclude : true,
		templateUrl : "/prefabs/app-for-users.html",
		link : function(scope, element, attributes) {
			$(".button-collapse").sideNav();
			$('.dropdown-button').dropdown();
		}
	}
}]);