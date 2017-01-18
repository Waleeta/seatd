angular.module('starter')

.controller('HomeCtrl', function($scope, $location, UserInfo) {
  $scope.goToSearch = function(path) {
    $location.path(path);
  }

  $scope.user = {};
  $scope.user = UserInfo.get();

  // $scope.logout = function() {
  //   // UserInfo.clear();
  //   $location.path('/login')
  // };
})
