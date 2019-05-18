app.service('userService', ['$http', '$q', function ($http, $q) {
    this.getUsers = function () {
        return $http.get("/User/GetAllUsers");
    }

    this.addUser = function (user) {
        var response = $http({
            method: "post",
            url: "/User/AddUser",
            data: JSON.stringify(user),
            dataType: "json"
        });
        return response;
    }
}]);
