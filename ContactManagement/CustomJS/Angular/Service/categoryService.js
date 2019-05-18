app.service('categoryService', ['$http', '$q', function ($http, $q) {
    this.getCategories = function () {
        return $http.get("/Category/GetAllCategories");
    }   

    this.addCategory = function (category) {
        var response = $http({
            method: "post",
            url: "/Category/AddCategory",
            data: JSON.stringify(category),
            dataType: "json"
        });
        return response;
    }
}]);
