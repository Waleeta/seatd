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

.factory('UserInfo', () => {
  const state = {
      data: []
  };
  return {
      get() {
        return state.data;
      },
      set(data) {
  return $resource("http://localhost:3000/businesses.json");
})

.factory('BusinessList', () => {
  // hold a local copy of the state, setting its defaults
  const state = {
      data: []
  };
  // expose basic getter and setter methods
  return {
      get() {
        console.log("Getting")
        return state.data;
      },
      set(data) {
        console.log("Setting ", data)
        Object.assign(state.data, data);
      },
  };
})


