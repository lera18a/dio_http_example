class EnviromentVariables {
  static const String apiKey = String.fromEnvironment("apiKey");
  static const String apiHost = String.fromEnvironment("apiHost");
  static const bool isDebug = bool.fromEnvironment(
    "isDebug",
    defaultValue: true,
  );
}
