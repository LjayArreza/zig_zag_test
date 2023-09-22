import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:zig_zag_test/initial.page.dart';

import 'app/core/environment/environment.dart';

Future<void> main() async {
  await dotenv.load(fileName: Environment.mode);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const InitialPage());
}
