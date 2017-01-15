angular.module('starter.services', [])

.factory('Business', function($resource) {
  return $resource("http://localhost:3000/businesses/:id.json");
})
