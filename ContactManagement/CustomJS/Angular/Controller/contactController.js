var basePath = "/CustomJS/Angular/Service/";

var files = ['contact'];
$.each(files, function (index, item) { $("head").append('<script type="text/javascript" src="' + basePath + item + 'Service.js"></script>');/*$("body")*/ });

app.controller("contactCtrl", function ($scope, $filter, $q, $window, contactService) {

    $scope.cStatus = true;
    $scope.Action = "Save";
    getAllContacts();
   
    (function populateCategory() {
        var getData = contactService.populateCategory();
        getData.then(function (res) {
            $scope.categories = res.data;
        }, function () {
            alert('Error in getting records');
        });
    })();
   

    function getAllContacts() {
        var getData = contactService.getAllContacts();
        getData.then(function (res) {
            $scope.contacts = res.data;
        }, function () {
            alert('Error in getting records');
        });
    }  

    $scope.editContact = function (index) {
        if ($window.confirm("Do you want to edit?")) {
            let contact = $scope.contacts[index];
            $scope.contactId = contact.ContactId;
            $scope.categoryId = contact.CategoryId;
            $scope.name = contact.Name;
            $scope.email = contact.Email;
            $scope.mobile = contact.Mobile;
            $scope.address = contact.Address;
            $scope.Action = "Update";
        }
    }

    $scope.deleteContact = function (index) {
        if ($window.confirm("Do you want to delete?")) {
            let contact = $scope.contacts[index];
            $scope.contactId = contact.ContactId;

            var getData = contactService.delContact($scope.contactId);
            getData.then(function (msg) {
                getAllContacts();
                alert(msg.data);
                ClearFields(form);
            }, function () {
                alert('Error in adding record');
            });
        }
    }

    $scope.addUpdateContact = function (form) {
        if (form.$valid) {
            var ContactInformation = {
                ContactId: $scope.contactId,
                CategoryId: $scope.categoryId,
                Name: $scope.name,
                Email: $scope.email,
                Mobile: $scope.mobile,
                Address: $scope.address
            }
            var getAction = $scope.Action;

            if (getAction == "Update") {
                ContactInformation.ContactId = $scope.contactId;
            }

            var getData = contactService.addContact(ContactInformation);
            getData.then(function (msg) {
                getAllContacts();
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
        $scope.contactId = '';
        $scope.categoryId = '';
        $scope.name = '';
        $scope.email = '';
        $scope.mobile = '';
        $scope.address = '';
        $scope.Action = "Save";
    }

    $scope.Cancel = function (form) {
        ClearFields(form);
    };
});