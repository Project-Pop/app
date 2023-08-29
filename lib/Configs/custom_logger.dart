// Package imports:
import 'package:logger/logger.dart';

// Project imports:
import 'package:app/Configs/environment.dart';

abstract class CustomLogger {
  static Level _level = Level.nothing;

  static void initialize(String env, [Level? level]) {
    if (env == Environment.prod) {
      _level = Level.nothing;
    } else {
      _level = level ?? Level.verbose;
    }
  }

  static Logger logger([Type? type]) =>
      Logger(printer: CustomPrinter(type?.toString()), level: _level);
}

class CustomPrinter extends LogPrinter {
  CustomPrinter(this.className);
  final String? className;

  @override
  List<String> log(LogEvent event) {
    final color = PrettyPrinter.levelColors[event.level];
    final emoji = PrettyPrinter.levelEmojis[event.level];
    final message = event.message;

    return [color!('$emoji $className: $message')];
  }
}
