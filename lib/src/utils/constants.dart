
//flutter run lib/main.dart --dart-define=host="backend_host" --dart-define=port="backend_port"

abstract class Constants {
  static const String API_HOST = String.fromEnvironment(
    'API_HOST',
    defaultValue: '45.80.152.43',
  );

  static const String API_PORT = String.fromEnvironment(
    'API_PORT',
    defaultValue: '8080',
  );

  static const String SERVICE_HOST = String.fromEnvironment(
    'SERVICE_HOST',
    defaultValue: '',
  );

  static const String SERVICE_PORT = String.fromEnvironment(
    'SERVICE_PORT',
    defaultValue: '',
  );
}
