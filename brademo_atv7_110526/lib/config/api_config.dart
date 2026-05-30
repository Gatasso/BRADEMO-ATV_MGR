import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConfig {
  static String get googleMapsApiKey {
    return dotenv.env['GOOGLE_MAPS_API_KEY'] ?? 'YOUR_GOOGLE_MAPS_API_KEY_HERE';
  }
}
