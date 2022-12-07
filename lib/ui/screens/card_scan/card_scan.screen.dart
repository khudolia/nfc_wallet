import 'package:flutter/material.dart';
import 'package:nfc_wallet/ui/screens/card_scan/card_scan.bloc.dart';
import 'package:nfc_wallet/ui/utils/rx_builder.dart';

class CardScanScreen extends StatelessWidget {
  const CardScanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RxBuilder<String>(
        stream: CardScanBloc.of(context).hex,
        builder: (context, sHex) {
          final hex = sHex.data;

          if (hex == null || hex.isEmpty) {
            return const Center(child: Text("Waiting scanning"));
          }

          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(child: Text(hex)),
              ],
            ),
          );
        },
      ),
    );
  }
}
