angular.module('starter')

.controller('BusinessCtrl', function(BusinessList, $scope) {
  $scope.displayedBusinesses = BusinessList.get();

  $scope.slideToPage = function(route) {
    $location.path('/businesses/' + route)
  }
  // var parsedDate = new Date(iso stamp)
})

.controller('BusinessShowCtrl', function($scope, BusinessShow, $stateParams, $http, UserInfo, $ionicPopup) {
  BusinessShow.get({'id': $stateParams.id }).$promise.then(function(response) {
    $scope.displayedBusiness = response.business;
    $scope.displayedEmployee = response.employee;
    $scope.availableAppointments = response.appointments;
    console.log($scope.displayedEmployee);
  })

  $scope.bookAppointment = function() {
    $scope.user = UserInfo.get();
    console.log($scope.user)

    var data = {
      client_id: $scope.user.id,
      booked: true
    };

    $http({
      url: 'http://172.16.0.19:3000/employees/' + $scope.displayedEmployee.id + '/appointments/' + $scope.id,
      method: 'PUT',
      data: data,
      headers: {
          "Content-Type": "application/json"
          },
        }).success(function(response) {
          console.log(data);
          console.log('updated');
        });
    };

    $scope.showConfirm = function() {
      $scope.id = this.id
      var confirmPopup = $ionicPopup.confirm({
        title: 'Book Appointment',
        template: 'Are you sure you want to book this appointment?'
      });
      confirmPopup.then(function(res) {
        if(res) {
          $scope.bookAppointment();
          console.log('You are sure');
        } else {
          console.log('You are not sure');
        }
      });
    };
})
