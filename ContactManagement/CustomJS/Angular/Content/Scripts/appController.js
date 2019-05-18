var app = angular.module('phonebookApp', []);
app.controller(
		'appController', 
		function($scope, $http) {
            $scope.filters = {
              group: 1
            };
			$http.get('search/persons').success(function(data, status, headers, config) 
			{
				$scope.persons = data;
			}).error(function(data, status, headers, config) 
			{
			  // log error http://localhost/ictch/index.php/search/persons
			  alert(data);
			});
			$http.get('search/visibilitys').success(function(data, status, headers, config)
			{
				$scope.groups = data;
			}).error(function(data, status, headers, config) 
			{
			  // log error http://localhost/ictch/index.php/search/persons
			  alert(data);
			})
            /*$scope.persons=[
                                {
                                    "Id":1,
                                    "Name":"Alexei Gekas",
                                    "Phone":"5487545233",
                                    "Group":1
                                },
                                {
                                    "Id":2,
                                    "Name":"Darrion Mate",
                                    "Phone":"5487545233",
                                    "Group":3
                                },
                                {
                                    "Id":4,
                                    "Name":"Palamedes Thoma",
                                    "Phone":"5487545233",
                                    "Group":2
                                },
                                {
                                    "Id":5,
                                    "Name":"Marcario Eliopoulos",
                                    "Phone":"5487545233",
                                    "Group":3
                                },
                                {
                                    "Id":6,
                                    "Name":"Diokles Matis",
                                    "Phone":"5487545233",
                                    "Group":2
                                },
                                {
                                    "Id":7,
                                    "Name":"Aristaeus Manago",
                                    "Phone":"5487545233",
                                    "Group":1
                                },
                                {
                                    "Id":8,
                                    "Name":"Chrysostom Dimitriou",
                                    "Phone":"5487545233",
                                    "Group":2
                                },
                                {
                                    "Id":9,
                                    "Name":"Eugenios Gogola",
                                    "Phone":"5487545233",
                                    "Group":1
                                },
                                {
                                    "Id":10,
                                    "Name":"Oenomaus Demos",
                                    "Phone":"5487545233",
                                    "Group":1
                                },
                            ];
            $scope.groups=[
                            {
                                "id":1,
                                "name":"Family"
                            },
                            {
                                "id":2,
                                "name":"Close Friend"
                            },
                            {
                                "id":3,
                                "name":"Professional"
                            }];*/

		}
	); 
