import 'package:animated_gesture_detector/animated_gesture_detector.dart';
import 'package:flutter/material.dart';
import 'package:nfc_wallet/models/card.dart';
import 'package:nfc_wallet/ui/screens/card_details/card_details.bloc.dart';
import 'package:nfc_wallet/ui/utils/rx_builder.dart';

class CardDetailsScreen extends StatelessWidget {
  const CardDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RxBuilder<CardModel?>(
        stream: CardDetailsBloc.of(context).card,
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
                Center(child: Text(card.hexData.toString())),
                AnimatedGestureDetector(
                  onTap: () {
                    CardDetailsBloc.of(context).startEmulating();
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
