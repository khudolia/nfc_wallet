import 'package:flutter/material.dart';
import 'package:nfc_wallet/initializer.dart';

import 'screens/main.screen.dart';

void main() async {
  await preInitializer();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Initializer(builder: (context, initialRoute) {
      return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const MainScreen(),
      );
    });
  }
}
