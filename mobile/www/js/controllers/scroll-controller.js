//handles the input for scrolling on search
angular.module('starter')

.controller('ScrollCtrl', function(BusinessList, $http, $scope, $timeout, $location, $ionicPopup) {

  $scope.myTitle = 'Template';

  $scope.distanceMiles = null;

  $scope.miles = [{
      distance: '1'
    }, {
      distance: '2'
    }, {
      distance: '3'
    }, {
      distance: '4'
    }, {
      distance: '5'
    }, {
      distance: '6'
    }, {
      distance: '7'
    }, {
      distance: '8'
    }, {
      distance: '9'
    }, {
      distance: '10'
    }
  ];

  $scope.itemName = null;

  $scope.items = [{
      name: "haircut"
    }, {
      name: "hair color"
    }, {
      name: "hair style"
    }, {
      name: "manicure"
    }, {
      name: "pedicure"
    }, {
      name: "wax"
    }, {
      name: "tattoo"
    }, {
      name: "hair color"
    }, {
      name: "tattoo"
    }, {
      name: "piercing"
    }, {
      name: "swedish massage"
    }, {
      name: "deep tissue massage"
    }, {
      name: "facial"
    }, {
      name: "laser treatment"
    }
  ];

  $scope.showSelectDistance = function(milesSelect) {
    $scope.distanceMiles = milesSelect;
  }

  $scope.showSelectValue = function(mySelect) {
    $scope.itemName = mySelect;
  }

  $scope.findBusinesses = function() {
    BusinessList.clear();
    $scope.businessSearch = { name: $scope.itemName, miles: $scope.distanceMiles };
    if ($scope.businessSearch.name != null && $scope.businessSearch.miles != null) {
      $http({
        url: 'http://172.16.0.19:3000/businesses.json?service=' + $scope.businessSearch.name,
      }).success(function(response){
        BusinessList.set(response.businesses);
        $location.path('/app/businesses')
      })
    } else {
      $scope.showAlert()
    }
  };

  $scope.findBusinessesMap = function() {
    BusinessList.clear();
    $scope.businessSearch = { name: $scope.itemName, miles: $scope.distanceMiles };
    if ($scope.businessSearch.name != null && $scope.businessSearch.miles != null) {
      $http({
        url: 'http://172.16.0.19:3000/businesses?service=' + $scope.businessSearch.name,
      }).success(function(response){
        BusinessList.set(response.businesses);
        console.log(BusinessList.get());
        $location.path('/app/map')
      })
    } else {
      $scope.showAlert()
    }
  };

  $scope.showAlert = function() {
    if ($scope.businessSearch.name == null) {
      var alertPopup = $ionicPopup.alert({
        title: 'Select an Option',
        template: 'Please select a service'
      });
      alertPopup.then(function(res) {
        console.log('select a service');
      });
    } else {
      console.log($scope.businessSearch.distanceMiles);
      var alertPopup = $ionicPopup.alert({
        title: 'Select an Option',
        template: 'Please select a distance'
      });
      alertPopup.then(function(res) {
        console.log('select a distance');
      });
    }
  };

  // $scope.showPopup = function() {
  //   $scope.data = {}

  //   var myPopup = $ionicPopup.show({
  //     template: '<p>must have correct info</p>',
  //     title: 'Please select an option',
  //     subTitle: 'Please, just do it',
  //     scope: $scope
  //   })
  // }
})
