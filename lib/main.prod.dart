// Project imports:
import 'package:app/Configs/environment.dart';
import 'package:app/main.app.dart';

Future<void> main() async {
  await mainApp(Environment.prod);
}
