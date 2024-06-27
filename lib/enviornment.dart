late Environment _env;

Environment get env => _env;

class Environment {
  final String defaultAppLanguageCode;

  Environment._init({
    required this.defaultAppLanguageCode,
  });

  static void init({
    String defaultAppLanguageCode = 'en',
  }) {
    _env = Environment._init(
      defaultAppLanguageCode: defaultAppLanguageCode,
    );
  }
}
