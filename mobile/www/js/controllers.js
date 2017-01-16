angular.module('starter.controllers', [])

.controller('AppCtrl', function($scope, $ionicModal, $timeout, $location) {

  // Form data for the login modal
  $scope.loginData = {};
  $scope.registerData = {};

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

  $scope.doRegister = function($http) {
    console.log('Register', $scope.loginData);
    var username = $scope.registerData.username;
    var password = $scope.registerData.password;
    console.log(password + username);
  };
})

//handles the input for scrolling on search
.controller('ScrollCtrl', function($scope, $timeout) {
  $scope.myTitle = 'Template';

  $scope.data = { 'miles' : '1' };

  var timeoutId = null;

  $scope.$watch('data.miles', function() {
    console.log('Has changed');
    console.log($scope.data);
  });
})

.controller('dropDownCtrl', function($scope){
  $scope.myTitle = 'Cascading Select';


  $scope.item = [{
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
})


.controller('BusinessCtrl', function($scope, Business) {
  Business.query().$promise.then(function(response){
    $scope.businesses = response;
  });
})

// .controller('BusinessCtrl', function($scope, $http) {


//     $http.get("https://secure-cliffs-27048.herokuapp.com/businesses.json")
//       .success(function(data) {
//         $scope.businesses = data;
//         console.log(data)
//       })
//       .error(function(data) {
//         console.log("errrrrror")
//       });

// })

// .controller(searchFeature = function($scope) {
//   $scope.showSelectValue = function(mySelect) {
//     console.log(mySelect);
//   }
// })

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

// .controller('RegisterCtrl', function($scope, $http) {
//   var config = {
//     params: {
//       'callback': 'JSON_CALLBACK',
//       'email': $scope.email,
//       'name': $scope.name,
//       'password': $scope.password,
//       'url': 'https://secure-cliffs-27048.herokuapp.com/users.json'
//     },
//   };

//   var $promise = $http.jsonp('response.json', config)
//   .success(function(data, status, headers, config) {
//     if (data.status == 'OK') {
//       $scope.email = null;
//       $scope.name = null;
//       $scope.password = null;
//     } else {
//       $scope.messages = 'Oops';
//     }
//   })
//   .error(function(data, status, headers, config) {
//     $scope.messages = 'ERROR';
//   });

//   $scope.progress.addPromise($promise);

// });

.controller('RegisterCtrl', function($scope, $http) {
  console.log('in the controller...')
  $scope.userData = {};

    $scope.sendPost = function() {
      var data = {
          name: $scope.userData.name,
          email: $scope.userData.email,
          password: $scope.userData.password
      };
      console.log(data);
      $http.post("https://secure-cliffs-27048.herokuapp.com/users", data).success(function(data, status) {
        console.log("holy shit we did it");
      })
    }
})
























