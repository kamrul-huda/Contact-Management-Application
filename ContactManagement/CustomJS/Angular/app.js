/*==========================================================

 ===========================================================*/
var app = angular.module('app', ['datatables']);
app.constant('appSettings', appSettings);

app.filter('jsonDate', ['$filter', function ($filter) {
    return function (input, format) {
        return (input) ? $filter('date')(parseInt(input.substr(6)), format) : '';
    };
}]);

app.directive('noDirty', function () {
    return {
        require: 'ngModel',
        link: function (scope, element, attrs, ngModelCtrl) {
            // override the $setDirty method on ngModelController
            ngModelCtrl.$setDirty = angular.noop;
        }
    }
})

app.directive("jqdatepicker", ['appSettings', function (appSettings) {
    return {
        restrict: "A",
        require: "ngModel",
        link: function (scope, elem, attrs, ngModelCtrl) {
            var updateModel = function (dateText) {
                scope.$apply(function () {
                    ngModelCtrl.$setViewValue(dateText);
                });
            };
            var options = {
                //format: 'm/d/Y',
                //dateFormat: "dd/mm/yy",
                timepicker: false,
                format: appSettings.dateFormat,//'d-M-Y',
                onSelect: function (dateText) {
                    updateModel(dateText);
                }
            };
            //elem.datepicker(options); 
            elem.datetimepicker(options);
        }
    }
}]);

//app.service('commonService', function () {    
//    this.IsMatch = function(arr, value) {
//        var newItem = value;
//        angular.forEach(arr, function (item) {
//            if (newItem == item.ItemName) {
//                alert('Item already exists!');
//                return false;
//            }
//        });
//    };  
//});

app.factory("commonService", function () {
    return {
        IsMatch: function (arr, value) {
            var newItem = value;
            angular.forEach(arr, function (item) {
                if (newItem == item.ItemName) {
                    alert('Item already exists!');
                    return false;
                }
                else {
                    return true;
                }
            });
        },
        first: function () {
            return users[0];
        }       
    };
});

app.directive("ngCompare", function () {
    return {
        require: "ngModel",
        link: function(scope, element, attrs, ctrl) {

            ctrl.$validators.ngCompare = function (val) {
                return val == scope.$eval(attrs.ngCompare);
            };

            scope.$watch(attrs.ngCompare, function () {
                ctrl.$validate();
            });
        }
    };
});


app.directive('number', function () {
    return {
        require: 'ngModel',
        restrict: 'A',
        link: function (scope, element, attrs, ctrl) {
            ctrl.$parsers.push(function (input) {
                if (input == undefined) return ''
                var inputNumber = input.toString().replace(/[^0-9]/g, '');
                if (inputNumber != input) {
                    ctrl.$setViewValue(inputNumber);
                    ctrl.$render();
                }
                return inputNumber;
            });
        }
    };
});


app.directive("floatingNumberOnly", function () {
    return {
        require: 'ngModel',
        link: function (scope, ele, attr, ctrl) {

            ctrl.$parsers.push(function (inputValue) {
                console.log(inputValue);
                var pattern = new RegExp("(^[0-9]{1,9})+(\.[0-9]{1,4})?$", "g");
                if (inputValue == '')
                    return '';
                var dotPattern = /^[.]*$/;

                if (dotPattern.test(inputValue)) {
                    console.log("inside dot Pattern");
                    ctrl.$setViewValue('');
                    ctrl.$render();
                    return '';
                }

                var newInput = inputValue.replace(/[^0-9.]/g, '');
                // newInput=inputValue.replace(/.+/g,'.');

                if (newInput != inputValue) {
                    ctrl.$setViewValue(newInput);
                    ctrl.$render();
                }
                //******************************************
                //***************Note***********************
                /*** If a same function call made twice,****
                 *** erroneous result is to be expected ****/
                //******************************************
                //******************************************

                var result;
                var dotCount;
                var newInputLength = newInput.length;
                if (result = (pattern.test(newInput))) {
                    console.log("pattern " + result);
                    dotCount = newInput.split(".").length - 1; // count of dots present
                    if (dotCount == 0 && newInputLength > 9) { //condition to restrict "integer part" to 9 digit count
                        newInput = newInput.slice(0, newInputLength - 1);
                        ctrl.$setViewValue(newInput);
                        ctrl.$render();
                    }
                } else { //pattern failed
                    console.log("pattern " + result);
                    // console.log(newInput.length);

                    dotCount = newInput.split(".").length - 1; // count of dots present
                    console.log("dotCount  :  " + dotCount);
                    if (newInputLength > 0 && dotCount > 1) { //condition to accept min of 1 dot
                        console.log("length>0");
                        newInput = newInput.slice(0, newInputLength - 1);
                        console.log("newInput  : " + newInput);

                    }
                    if ((newInput.slice(newInput.indexOf(".") + 1).length) > 4) { //condition to restrict "fraction part" to 4 digit count only.
                        newInput = newInput.slice(0, newInputLength - 1);
                        console.log("newInput  : " + newInput);

                    }
                    ctrl.$setViewValue(newInput);
                    ctrl.$render();
                }

                return newInput;
            });
        }
    };
});

app.directive('integer', function () {
    var INTEGER_REGEXP = /^-?\d+$/;
    return {
        require: 'ngModel',
        link: function (scope, elm, attrs, ctrl) {
            ctrl.$validators.integer = function (modelValue, viewValue) {
                if (ctrl.$isEmpty(modelValue)) {
                    // consider empty models to be valid
                    return true;
                }

                if (INTEGER_REGEXP.test(viewValue)) {
                    // it is valid
                    return true;
                }

                // it is invalid
                return false;
            };
        }
    };
});

app.directive('overwriteText', function () {
    var EMAIL_REGEXP = /^[a-z0-9!#$%&'*+/=?^_`{|}~.-]+@example\.com$/i;

    return {
        require: '?ngModel',
        link: function (scope, elm, attrs, ctrl) {
            // only apply the validator if ngModel is present and AngularJS has added the email validator
            if (ctrl && ctrl.$validators.email) {

                // this will overwrite the default AngularJS email validator
                ctrl.$validators.email = function (modelValue) {
                    return ctrl.$isEmpty(modelValue) || EMAIL_REGEXP.test(modelValue);
                };
            }
        }
    };
});

//app.directive('ngMin', function () {
//    return {
//        restrict: 'A',
//        require: 'ngModel',
//        link: function (scope, elem, attr, ctrl) {
//            scope.$watch(attr.ngMin, function () {
//                ctrl.$setViewValue(ctrl.$viewValue);
//            });
//            var minValidator = function (value) {
//                var min = attr.ngMin || 0;
//                if (!isEmpty(value) && value < min) {
//                    ctrl.$setValidity('ngMin', false);
//                    return undefined;
//                } else {
//                    ctrl.$setValidity('ngMin', true);
//                    return value;
//                }
//            };
//            ctrl.$parsers.push(minValidator);
//            ctrl.$formatters.push(minValidator);
//        }
//    };
//});

app.directive('phone', function () {
    var PHONE_REGEXP = /^[(]{0,1}[0-9]{3}[)\.\- ]{0,1}[0-9]{3}[\.\- ]{0,1}[0-9]{4}$/;

    return {
        restrice: 'A',
        require: 'ngModel',
        link: function (scope, element, attrs, ctrl) {
            angular.element(element).bind('blur', function () {
                var value = this.value;
                if (PHONE_REGEXP.test(value)) {
                    // Valid input
                    console.log("valid phone number");
                    angular.element(this).next().next().css('display', 'none');
                } else {
                    // Invalid input  
                    console.log("invalid phone number");
                    angular.element(this).next().next().css('display', 'block');
                    /* 
                        Looks like at this point ctrl is not available,
                        so I can't user the following method to display the error node:
                        ctrl.$setValidity('currencyField', false); 
                    */
                }
            });
        }
    }
});