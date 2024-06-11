import 'package:flutter_dotenv/flutter_dotenv.dart';

class FirebaseConstants {
  final uploadDir = '${dotenv.env['UPLOAD_DIR']}';
}
