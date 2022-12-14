import 'package:animated_gesture_detector/animated_gesture_detector.dart';
import 'package:flutter/material.dart';
import 'package:nfc_wallet/models/card.dart';
import 'package:nfc_wallet/ui/screens/card_scan/card_scan.bloc.dart';
import 'package:nfc_wallet/ui/utils/rx_builder.dart';

class CardScanScreen extends StatelessWidget {
  const CardScanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RxBuilder<CardModel?>(
        stream: CardScanBloc.of(context).card,
        builder: (context, sCard) {
          final card = sCard.data;

          if (card == null) {
            return const Center(child: Text("Waiting scanning"));
          }

          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(child: Text(card.handle)),
                AnimatedGestureDetector(
                  onTap: () {
                    CardScanBloc.of(context).saveCard();
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    width: 50,
                    height: 50,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
