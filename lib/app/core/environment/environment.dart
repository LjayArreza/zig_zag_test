import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get mode {
    if (kReleaseMode) {
      return '.env/.env.prod';
    }
    return '.env/.env.dev';
  }

  static String get apiUrl {
    return dotenv.env['API_URL'] ?? 'API url not found';
  }
}
