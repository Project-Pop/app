import 'package:app/ConfigReader/environment.dart';
import 'package:app/main.app.dart';

Future<void> main() async {
  await mainApp(Environment.dev);
}
