
import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}