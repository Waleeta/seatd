angular.module('starter.services', [])

.factory('Business', function($resource) {
  return $resource("https://secure-cliffs-27048.herokuapp.com/businesses/:id.json");
})

// .factory('BusinessMaker', function($resource, $http) {

// })
