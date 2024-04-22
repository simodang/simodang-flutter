import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  final baseUrl = '${dotenv.env['BASE_URL']}';
}
