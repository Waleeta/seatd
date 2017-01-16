angular.module('starter.services', [])

.factory('Business', function($resource) {
  return $resource("http://172.16.0.19:3000/businesses/:id.json");
})

// .factory(‘AuthInterceptor’, function($q) {
//   return {
//     ‘request’: function(config) {
//       config.headers.Authorization = window.localStorage[‘authToken’];
//       return config;
//     }
//   };
// });


