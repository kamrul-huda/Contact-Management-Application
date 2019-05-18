var basePath = "/CustomJS/Angular/Service/";

var files = ['category']; 
$.each(files, function (index, item) { $("head").append('<script type="text/javascript" src="' + basePath + item + 'Service.js"></script>');/*$("body")*/ });

app.controller("categoryCtrl", function ($scope, $filter, $q, $window, categoryService) {

    
    $scope.Action = "Save";
    getAllCategories();

    function getAllCategories() {
        var getData = categoryService.getCategories();
        getData.then(function (res) {
            $scope.categories = res.data;
        }, function () {
            alert('Error in getting records');
        });
    }

    $scope.editCategory = function (index) {
        if ($window.confirm("Do you want to edit?")) {
            let category = $scope.categories[index];
            $scope.categoryId = category.CategoryId;
            $scope.title = category.Title;
            $scope.description = category.Description;
            $scope.Action = "Update";
        }
    }

    $scope.addUpdateCategory = function (form) {
        if (form.$valid) {           
            var Category = {
                CategoryId: $scope.categoryId,
                Title: $scope.title,
                Description: $scope.description
            }
            var getAction = $scope.Action;

            if (getAction == "Update") {
                Category.CategoryId = $scope.categoryId;
            }

            var getData = categoryService.addCategory(Category);
            getData.then(function (msg) {
                getAllCategories();
                alert(msg.data);
                ClearFields(form);     
            }, function () {
                alert('Error in adding record');
            });

            form.$setPristine();
            form.$setUntouched();
        }
    }

    function ClearFields(form) {
        if (form) {
            form.$setPristine();
            form.$setUntouched();
        }
        $scope.categoryId = "";
        $scope.title = "";
        $scope.description = "";
        $scope.Action = "Save";
    }

    $scope.Cancel = function (form) {       
        ClearFields(form);
    };
});