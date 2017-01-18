angular.module('starter')

.controller("MapCtrl", function($scope, BusinessList) {
  var myLatLng = new google.maps.LatLng(41.8762, -87.6531);

  var mapOptions = {
    center: myLatLng,
    zoom: 14,
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

    google.maps.event.addListener(marker, 'mousedown', (function(marker, i) {
      return function() {
        window.location.href = markers[i].url;
      }
    })(marker, i));
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

    $scope.$on('$ionicView.beforeEnter', function() {
      angular.forEach(searchedBusinesses, function(business, key) {
        filterMarkers(business.business_name);
      });

      angular.forEach(showMarkers, function(marker, key) {
        marker.setVisible(true);
      });
    })
})
