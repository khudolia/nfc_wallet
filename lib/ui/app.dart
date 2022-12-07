import 'package:flutter/material.dart';
import 'package:nfc_wallet/initializer.dart';
import 'package:nfc_wallet/ui/screens/card_scan/card_scan.init.dart';
import 'package:nfc_wallet/ui/screens/main.screen.dart';

part 'routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Initializer(
      builder: (context, initialRoute) {
        return MaterialApp(
          theme: ThemeData(primarySwatch: Colors.blue),
          initialRoute: initialRoute,
          onGenerateRoute: (settings) {
            return _generateRoute(settings, context);
          },
        );
      },
    );
  }
}
