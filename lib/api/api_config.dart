class ApiConfig {
  static const String scheme = 'http';
  static const String host = 'localhost';
  static const int port = 8092;
  static const String basePath = '/b-connect';

  static String get baseUrl => '$scheme://$host:$port$basePath';
}
