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
.controller('ScrollCtrl', function(BusinessList, Business, $scope, $timeout, $location, $rootScope) {

  $scope.myTitle = 'Template';

  $scope.data = { 'miles' : '1' };

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

  $scope.showSelectValue = function(mySelect) {
    $scope.itemName = mySelect;
  }

  $scope.findBusinesses = function() {
    $rootScope.stuff = 'fudge brownie sunday'
    $scope.businessSearch = { name: $scope.itemName, miles: $scope.data.miles}
    console.log($scope.businessSearch);
    if ($scope.businessSearch.name != null) {
      Business.query({type: "tattoo"}).$promise.then(function(response){
        // console.log(response);
        BusinessList.set(response);
        $location.path('/app/businesses')
      });
    } else {
      console.log('must select a service')
    }
  }

})

.controller('BusinessCtrl', function(BusinessList, $scope, Business, $rootScope) {
  $scope.displayedBusinesses = BusinessList.get();
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

  var markers = [
    {
      title: 'Manchester Salon', lat: 41.891790, long: -87.635979
    }, {
      title: 'XO Studio', lat: 41.877837, long: -87.654234
    }, {
      title: 'Cellar Door Salon & Studio', lat: 41.879149, long: -87.652479
    }, {
      title: 'Aria Salon', lat: 41.877423, long: -87.649400
    }, {
      title: 'Twisted Scissors', lat: 41.874459, long: -87.650881
    }, {
      title: 'Taylor Street Tattoo', lat: 41.869622, long: -87.656237
    }, {
      title: 'Great Lakes Tattoos', lat: 41.891402, long: -87.656549
    }, {
      title: 'Code of Conduct', lat: 41.869418, long: -87.626827
    }, {
      title: 'Mayday Tattoo Co', lat: 41.891172, long: -87.667746
    }, {
      title: 'Insight Studios', lat: 41.901056, long: -87.663276
    }, {
      title: 'Jewel Nail Spa', lat: 41.879312, long: -87.648838
    }, {
      title: 'Nail Lacquer Salon', lat: 41.880521, long: -87.652392
    }, {
      title: 'HM Day Spa', lat: 41.881486, long: -87.650510
    }, {
      title: 'Saraya Salon & Spa', lat: 41.862354, long: -87.627224
    }, {
      title: 'The Hair Loft', lat: 41.882514, long: -87.652943
    }, {
      title: 'Zana', lat: 41.881041, long: -87.656858
    }, {
      title: "lillieAnne's Massage & Skincare", lat: 41.883222, long: -87.659096
    }, {
      title: 'Lustre Skin Boutique', lat: 41.885785, long: -87.652483
    }, {
      title: 'Smuve Skincare Studio', lat: 41.883518, long: -87.625873
    }, {
      title: 'Hand & Stone Massage & Facial', lat: 41.868568, long: -87.624520
    }, {
      title: 'Healthy Zu Spa', lat: 41.883691, long: -87.647659
    }, {
      title: 'Chicago Touch', lat: 41.885239, long: -87.660354
    }, {
      title: 'Oxygen Spa', lat: 41.876265, long: -87.648709
    }, {
      title: 'Green Spa', lat: 41.883652, long: -87.648709
    }, {
      title: 'La Vie Massage', lat: 41.881740, long: -87.631963
    }
  ];

  for (i = 0; i < markers.length; i++) {
    marker = new google.maps.Marker({
      position: new google.maps.LatLng(markers[i].lat, markers[i].long),
      map: map
    });
    infowindow = new google.maps.InfoWindow({
      content: markers[i].title,
    });

    google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          infowindow.setContent(markers[i].title);
          infowindow.open(map, marker);
        }
      })(marker, i));
  }

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
























