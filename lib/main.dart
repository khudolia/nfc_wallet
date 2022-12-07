import 'package:flutter/material.dart';
import 'package:nfc_wallet/initializer.dart';

import 'ui/app.dart';

void main() async {
  await preInitializer();

  runApp(const App());
}

