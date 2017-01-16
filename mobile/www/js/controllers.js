angular.module('starter.controllers', [])

.controller('AppCtrl', function($scope, $ionicModal, $timeout, $location) {

  // Form data for the login modal
  $scope.loginData = {};

  // function persist() {
  //   window.localStorage[registerData] = angular.toJson(registerData);
  // }

  //function for logging out
  $scope.logout = function() {
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
    console.log('doop');
    $scope.modal.show();
  };

  // Perform the login action when the user submits the login form
  $scope.doLogin = function($http) {
    console.log('Doing login', $scope.loginData);
    var username = $scope.loginData.username;
    var password = $scope.loginData.password;

    if (username == 'ferd' && password == 'password') {
      console.log('hey');
      $location.path('/app/cover')
    } else {
      console.log('fuck it');
    }
    // Simulate a login delay. Remove this and replace with your login
    // code if using a login system
    $timeout(function() {
      $scope.closeLogin();
    }, 1000);
  };
})

//handles the input for scrolling on search
.controller('ScrollCtrl', function($scope, $timeout, $location) {
  $scope.myTitle = 'Template';

  $scope.data = { 'miles' : '1' };

  $scope.itemName = null;

  var timeoutId = null;

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


  $scope.showSelectValue = function(mySelect) {
    $scope.itemName = mySelect;
  }

  // $scope.$watch('data.miles', function() {
  //   console.log('Has changed');
  //   console.log($scope.data);
  // });



  $scope.findBusinesses = function() {
    $scope.businessSearch = { name: $scope.itemName, miles: $scope.data.miles}
    if ($scope.businessSearch.name != null) {
      console.log($scope.data);
      console.log($scope.itemName);
      console.log($scope.businessSearch);
      $location.path('/app/businesses')
    } else {
      console.log('must select a service')
    }
  }


})

.controller('BusinessCtrl', function($scope, Business) {
  Business.query().$promise.then(function(response){

    var selectedBusinesses = [];

    $scope.businesses = response;

    for (var i = 0; i < $scope.businesses.length; i++) {
      if ($scope.businesses[i].business_name === "Taylor Street Tattoo") {
        selectedBusinesses.push($scope.businesses[i]);
      } else {
        false
      }
    }
    console.log(selectedBusinesses)
    $scope.displayedBusinesses = selectedBusinesses;
    console.log(response);
  });
})


.controller("MapCtrl", function($scope) {

  var myLatLng = new google.maps.LatLng(41.8762, -87.6531);

  var mapOptions = {
    center: myLatLng,
    zoom: 16,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  var map = new google.maps.Map(document.getElementById("map"), mapOptions);

  var marker = new google.maps.Marker({
    position: myLatLng,
    animation:google.maps.Animation.BOUNCE,
    map: map,
    title: 'Hey There!'
  });

  navigator.geolocation.getCurrentPosition(function(pos) {
    map.setCenter(new google.maps.LatLng(pos.coords.latitude, pos.coords.longitude));
  });

  $scope.map = map;
})

.controller('RegisterCtrl', function($scope, $http, $location) {
  $scope.userData = {};

    $scope.sendPost = function() {
      var data = {
        name: $scope.userData.name,
        email: $scope.userData.email,
        password: $scope.userData.password
      };
      console.log(data);

      $http({
        url: 'http://localhost:3000/users',
        dataType: 'json',
        method: 'POST',
        data: data,
        headers: {
          "Content-Type": "application/json"
          },
          }).success(function(response){
            $location.path('/app/cover')
            $scope.userData = {};
          }).error(function(error){
            // need something here....
          });
      }
  })
























