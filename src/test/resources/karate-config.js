function fn() {

  karate.configure('logPrettyRequest', true);
  karate.configure('logPrettyResponse', true);
  // Em caso de erro de certificado descomentar a linha abaixo
   karate.configure('ssl', true);

  var config = {
    baseUrl: 'https://serverest.dev'
  };

  return config;
}