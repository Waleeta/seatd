angular.module('starter')

.controller('RegisterCtrl', function($scope, $http, $location, UserInfo) {

  $scope.userData = {};

  $scope.sendPost = function() {
    var data = {
      name: $scope.userData.name,
      email: $scope.userData.email,
      password: $scope.userData.password
    };

  $http({
    url: 'http://172.16.0.19:3000/users',
    dataType: 'json',
    method: 'POST',
    data: data,
    headers: {
      "Content-Type": "application/json"
      },
      }).success(function(response){
        window.localStorage['authToken'] = response.user.auth_token;
        UserInfo.set(response.user);
        $location.path('/app/cover')
        $scope.userData = {};
      }).error(function(error){
        // need something here....
    });
  }
})
