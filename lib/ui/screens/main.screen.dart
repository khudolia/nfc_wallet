import 'package:flutter/material.dart';

import 'cards_list/cards_list.init.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your wallet'),
      ),
      body: const CardListInit(),
    );
  }
}
