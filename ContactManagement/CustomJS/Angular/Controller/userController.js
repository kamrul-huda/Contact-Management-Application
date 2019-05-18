var basePath = "/CustomJS/Angular/Service/";

var files = ['user'];
$.each(files, function (index, item) { $("head").append('<script type="text/javascript" src="' + basePath + item + 'Service.js"></script>'); });

app.controller("userCtrl", function ($scope, $filter, $q, $window, userService) {

    $scope.cStatus = true;
    $scope.Action = "Save";
    
    getAllUsers();

    function getAllUsers() {
        var getData = userService.getUsers();
        getData.then(function (res) {
            $scope.users = res.data;
        }, function () {
            alert('Error in getting records');
        });
    }

    $scope.editUser = function (index) {
        if ($window.confirm("Do you want to edit?")) {
            let user = $scope.users[index];
            $scope.userId = user.UserId;
            $scope.name = user.Name;
            $scope.mobile = user.Mobile;
            $scope.address = user.Address;
            $scope.Action = "Update";
        }
    }

    $scope.addUpdateUser = function (form) {
        if (form.$valid) {
            var User = {
                UserId: $scope.userId,
                Name: $scope.name,
                Mobile: $scope.mobile,
                Address: $scope.address
            }
            var getUserAction = $scope.Action;

            if (getUserAction == "Update") {
                User.UserId = $scope.userId;
            }

            var getData = userService.addUser(User);
            getData.then(function (msg) {
                getAllUsers();
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
        $scope.userId = "";
        $scope.name = "";
        $scope.mobile = "";
        $scope.address = "";
        $scope.Action = "Save";
    }

    $scope.Cancel = function (form) {
        ClearFields(form);
    };    
});