import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nfc_wallet/ui/screens/main.screen.dart';
import 'package:nfc_wallet/ui/utils/simple_code.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    runAfterBuild((_) {
      Future.delayed(const Duration(seconds: 1)).then(
        (value) => MainScreen.navigate(context),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white);
  }
}
