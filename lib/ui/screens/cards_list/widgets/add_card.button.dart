import 'package:animated_gesture_detector/animated_gesture_detector.dart';
import 'package:flutter/material.dart';
import 'package:nfc_wallet/ui/screens/card_scan/card_scan.init.dart';
import 'package:nfc_wallet/ui/screens/cards_list/cards_list.bloc.dart';

class AddCartButton extends StatelessWidget {
  const AddCartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedGestureDetector(
      onTap: () async {
        await CardScanInit.navigate(context);

        CardsListBloc.of(context).getCards();
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Colors.red,
        ),
      ),
    );
  }
}
