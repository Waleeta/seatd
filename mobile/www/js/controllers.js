angular.module('starter.controllers', [])

.controller('AppCtrl', function($scope, $ionicPopup, $ionicModal, $timeout, $location, $http, $log, UserInfo) {
  // Form data for the login modal
  $scope.loginData = {};

  // function persist() {
  //   window.localStorage[registerData] = angular.toJson(registerData);
  // }

  //function for logging out
  $scope.logout = function() {
    // UserInfo.clear();
    $location.path('/login')
  };

  // Create the login modal that we will use later
  $ionicModal.fromTemplateUrl('templates/login.html', {
    scope: $scope
  }).then(function(modal) {
    $scope.modal = modal;
  });

  // Triggered in the login modal to close it
  $scope.closeLogin = function() {
    $scope.modal.hide();
  };

  // Open the login modal
  $scope.login = function() {
    $scope.modal.show();
  };

  // Perform the login action when the user submits the login form
  $scope.doLogin = function(email, password) {
    $http.post('http://172.16.0.19:3000/authenticate', {
      email: $scope.loginData.email,
      password: $scope.loginData.password
    }).then(function(response) {
      window.localStorage['authToken'] = response.data.token;
      $location.path('/app/cover');
      $scope.loginData = {};
      UserInfo.set(response.data.user);
    }, function(error) {
      alert('Email or password is incorrect - please try again.')
      $log.log(error)
    });
  };
})

