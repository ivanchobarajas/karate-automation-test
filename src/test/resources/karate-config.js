function fn() {
  var config = {
    env: karate.env || 'local',
    baseUrl: 'https://example.com',
    headless: true,
    slowMo: 0
  };

  karate.configure('retry', { count: 3, interval: 1000 });
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);

  return config;
}

