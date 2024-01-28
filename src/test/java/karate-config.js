function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
    var apiUrl;
    var dataSource;

    if (!env) {
        env = 'qa';
    }
    if (env === 'qa') {
        apiUrl ='http://localhost:3000'
        dataSource = 'qa'
    }
    if (env === 'uat') {
        apiUrl ='http://localhost:3000'
        dataSource = 'uat'
    }

    var config = {
        apiUrl, env, dataSource
    }

    karate.configure('ssl', true);
    karate.configure('headers', { 'User-Agent': 'Chrome/114.0.0.0' });
    return config;
}