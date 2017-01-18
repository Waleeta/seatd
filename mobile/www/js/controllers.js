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
    console.log('doop');
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
      console.log(UserInfo.get())
    }, function(error) {
      alert('Email or password is incorrect - please try again.')
      $log.log(error)
    });
  };
})

//handles the input for scrolling on search
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

.controller("MapCtrl", function($scope, BusinessList) {
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
    title: 'Dev Bootcamp'
  });

  var markers = [
    {
      title: 'Manchester Salon', lat: 41.891790, long: -87.635979, url: '/#/app/businesses/1'
    }, {
      title: 'XO Studio', lat: 41.877837, long: -87.654234, url: '/#/app/businesses/2'
    }, {
      title: 'Cellar Door Salon & Studio', lat: 41.879149, long: -87.652479, url: '/#/app/businesses/3'
    }, {
      title: 'Aria Salon', lat: 41.877423, long: -87.649400, url: '/#/app/businesses/4'
    }, {
      title: 'Twisted Scissors', lat: 41.874459, long: -87.650881, url: '/#/app/businesses/5'
    }, {
      title: 'Taylor Street Tattoo', lat: 41.869622, long: -87.656237, url: '/#/app/businesses/6'
    }, {
      title: 'Great Lakes Tattoos', lat: 41.891402, long: -87.656549, url: '/#/app/businesses/7'
    }, {
      title: 'Code of Conduct', lat: 41.869418, long: -87.626827, url: '/#/app/businesses/7'
    }, {
      title: 'Mayday Tattoo Co', lat: 41.891172, long: -87.667746, url: '/#/app/businesses/9'
    }, {
      title: 'Insight Studios', lat: 41.901056, long: -87.663276, url: '/#/app/businesses/10'
    }, {
      title: 'Jewel Nail Spa', lat: 41.879312, long: -87.648838, url: '/#/app/businesses/11'
    }, {
      title: 'Nail Lacquer Salon', lat: 41.880521, long: -87.652392, url: '/#/app/businesses/12'
    }, {
      title: 'HM Day Spa', lat: 41.881486, long: -87.650510, url: '/#/app/businesses/13'
    }, {
      title: 'Saraya Salon & Spa', lat: 41.862354, long: -87.627224, url: '/#/app/businesses/14'
    }, {
      title: 'The Hair Loft', lat: 41.882514, long: -87.652943, url: '/#/app/businesses/15'
    }, {
      title: 'Zana', lat: 41.881041, long: -87.656858, url: '/#/app/businesses/16'
    }, {
      title: "lillieAnne's Massage & Skincare", lat: 41.883222, long: -87.659096, url: '/#/app/businesses/17'
    }, {
      title: 'Lustre Skin Boutique', lat: 41.885785, long: -87.652483, url: '/#/app/businesses/18'
    }, {
      title: 'Smuve Skincare Studio', lat: 41.883518, long: -87.625873, url: '/#/app/businesses/19'
    }, {
      title: 'Hand & Stone Massage & Facial', lat: 41.868568, long: -87.624520, url: '/#/app/businesses/20'
    }, {
      title: 'Healthy Zu Spa', lat: 41.883691, long: -87.647659, url: '/#/app/businesses/21'
    }, {
      title: 'Chicago Touch', lat: 41.885239, long: -87.660354, url: '/#/app/businesses/22'
    }, {
      title: 'Oxygen Spa', lat: 41.876265, long: -87.648709, url: '/#/app/businesses/23'
    }, {
      title: 'Green Spa', lat: 41.883652, long: -87.648709, url: '/#/app/businesses/24'
    }, {
      title: 'La Vie Massage', lat: 41.881740, long: -87.631963, url: '/#/app/businesses/25'
    }
  ];

  var madeMarkers = [];

  for (i = 0; i < markers.length; i++) {
    marker = new google.maps.Marker({
      position: new google.maps.LatLng(markers[i].lat, markers[i].long),
      map: map,
      title: markers[i].title,
      label: markers[i].title,
    });
    marker.setVisible(false);
    madeMarkers.push(marker)
    infowindow = new google.maps.InfoWindow({
      content: markers[i].title,
    });

    // google.maps.event.addListener(marker, 'click', (function(marker, i) {
    //     return function() {
    //       infowindow.setContent(markers[i].title);
    //       infowindow.open(map, marker);
    //     }
    //   })(marker, i));

        google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          window.location.href = markers[i].url;
        }
      })(marker, i));

    // google.maps.event.addListener(marker, 'click', function() {
    //   window.location.href = this.url;
    // });
  }

  navigator.geolocation.getCurrentPosition(function(pos) {
    map.setCenter(new google.maps.LatLng(pos.coords.latitude, pos.coords.longitude));
  });

  $scope.map = map;

  var showMarkers = []

  filterMarkers = function(businessName) {
      for (i = 0; i < markers.length; i++) {
        marker = madeMarkers[i]
        if (marker.title == businessName) {
          showMarkers.push(marker)
        }
      }
    }

    var searchedBusinesses = BusinessList.get();

    $scope.$on('$ionicView.enter', function() {
      console.log("hello")
      angular.forEach(searchedBusinesses, function(business, key) {
        console.log("al;skdjf")
        filterMarkers(business.business_name);
      });

      angular.forEach(showMarkers, function(marker, key) {
        console.log('whomp whomp')
        marker.setVisible(true);
      });
    })
})

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

.controller('UserCtrl', function($scope, UserInfo, $http) {
  $scope.appointments = {};
  $scope.user = {};
  $scope.user = UserInfo.get();
  console.log(UserInfo.get())


  $scope.getAppts = function() {
    $http({
    method: 'GET',
    url: 'http://172.16.0.19:3000/users/' + $scope.user.id +'.json'
    }).then(function successCallback(response) {
      console.log(response)
      $scope.appointments = response.data.appointments;
    }, function errorCallback(response) {
  });
  }

  $scope.$on('$ionicView.enter', function() {
     $scope.getAppts();
  })

})


