app.service('contactService', ['$http', '$q', function ($http, $q) {
    this.getAllContacts = function () {
        return $http.get("/Contact/GetAllContacts");
    }

    this.populateCategory = function () {
        return $http.get("/Category/PopulateCategories");
    }

    //this.getItemCategoryByGroup = function (groupId) {
    //    var response = $http({
    //        method: "get",
    //        url: "/ContactInformation/PopulateCategoryByGroup",
    //        params: {
    //            id: JSON.stringify(groupId)
    //        }
    //    });
    //    return response;
    //}

    this.delContact = function (contactId) {
        var response = $http({
            method: "get",
            url: "/Contact/DeleteContact",
            params: {
                id: JSON.stringify(contactId)
            }
        });
        return response;
    }

    
   
    this.addContact = function (contact) {
        var response = $http({
            method: "post",
            url: "/Contact/AddContact",
            data: JSON.stringify(contact),
            dataType: "json"
        });
        return response;
    }
}]);
