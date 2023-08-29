// Package imports:
import 'package:logging/logging.dart';

// Project imports:
import 'package:app/Configs/custom_logger.dart';
import 'package:app/Configs/environment.dart';
import 'package:app/main.app.dart';

Future<void> main() async {
  _setupLogging();
  await mainApp(Environment.dev);
}

void _setupLogging() {
  CustomLogger.initialize(Environment.dev);

// this logger is set for Chopper Http Logger

  final logger = CustomLogger.logger();

  Logger.root.level = Level.ALL;

  Logger.root.onRecord.listen((rec) {
    // logging at info level
    logger.i('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}
