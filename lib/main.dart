import 'package:flutter/material.dart';

import 'core/di/service_locator.dart';
import 'features/splash/presentation/pages/splash_page.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clean Architecture App',
      home: SplashPage(),
    );
  }
}
