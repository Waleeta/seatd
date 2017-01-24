angular.module('starter')

.controller('UserCtrl', function($scope, UserInfo, $http) {
  $scope.appointments = {};
  $scope.user = {};
  $scope.user = UserInfo.get();


  $scope.getAppts = function() {
    $http({
    method: 'GET',
    url: 'http://172.16.0.19:3000/users/' + $scope.user.id +'.json'
    }).then(function successCallback(response) {
      $scope.appointments = response.data.appointments;
    }, function errorCallback(response) {
  });
  }

  $scope.$on('$ionicView.loaded', function() {
     $scope.getAppts();
  })

})
