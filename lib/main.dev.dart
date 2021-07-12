// Package imports:
import 'package:logging/logging.dart';

// Project imports:
import 'package:app/ConfigReader/environment.dart';
import 'package:app/main.app.dart';

Future<void> main() async {
  _setupLogging();
  await mainApp(Environment.dev);
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}
