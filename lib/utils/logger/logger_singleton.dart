import 'package:logger/logger.dart';

class LoggerSingleton {
  static final LoggerSingleton _singleton = LoggerSingleton._internal();
  late final Logger _logger;

  factory LoggerSingleton() {
    return _singleton;
  }

  LoggerSingleton._internal() {
    _logger = Logger(
      printer: PrettyPrinter()
    );
  }

  Logger get logger => _logger;
}
