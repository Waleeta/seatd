angular.module('starter.services', [])

.factory('Business', function($resource) {
  return $resource("http://localhost:3000/search.json");
})

.factory('UserInfo', () => {
  const state = {
      data: []
  };
  return {
      get() {
        return state.data;
      },
      set(data) {
        Object.assign(state.data, data);
        },
      clear() {
        state.data = [];
      }
    };
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

.factory('AuthInterceptor', function($q) {
  return {
    'request': function(config) {
      config.headers.Authorization = window.localStorage['authToken'];
      return config;
    },
  };
});



