import 'package:flutter/material.dart';
import 'package:nfc_wallet/ui/screens/card_scan/card_scan.bloc.dart';
import 'package:nfc_wallet/ui/screens/card_scan/card_scan.screen.dart';
import 'package:nfc_wallet/ui/utils/bloc.dart';

class CardScanInit extends StatelessWidget {
  const CardScanInit({Key? key}) : super(key: key);

  static const routeName = '/card_scan';

  static void navigate(BuildContext context) {
    Navigator.of(context).pushNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      blocBuilder: () {
        return CardScanBloc();
      },
      builder: (context, bloc) {
        return const CardScanScreen();
      },
    );
  }
}
