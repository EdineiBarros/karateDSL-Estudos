function fn() {

  karate.configure('logPrettyRequest', true);
  karate.configure('logPrettyResponse', true);

  var config = {
    baseUrl: 'https://serverest.dev'
  };

  return config;
}