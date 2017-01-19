angular.module('starter')

.controller('BusinessCtrl', function(BusinessList, $scope) {
  $scope.displayedBusinesses = BusinessList.get();

  $scope.noBiz = function() {
    if($scope.displayedBusinesses.length > 0) {
      return false;
    } else {
      return true;
    }
  }

  $scope.slideToPage = function(route) {
    $location.path('/businesses/' + route)
  }
})

.controller('BusinessShowCtrl', function($scope, $location, BusinessShow, $stateParams, $http, UserInfo, $ionicPopup) {

  $scope.getBusinessInfo = function() {
    BusinessShow.get({'id': $stateParams.id }).$promise.then(function(response) {
      $scope.displayedBusiness = response.business;
      $scope.displayedEmployee = response.employee;
      $scope.availableAppointments = response.appointments;
    })
  }

  $scope.bookAppointment = function() {
    $scope.user = UserInfo.get();
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
          $location.path('/app/profile')
        } else {
        }
      });
    };

    $scope.$on('$ionicView.beforeEnter', function() {
      $scope.getBusinessInfo();
    })

})
