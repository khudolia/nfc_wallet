import 'package:animated_gesture_detector/animated_gesture_detector.dart';
import 'package:flutter/material.dart';
import 'package:nfc_wallet/ui/screens/card_scan/card_scan.init.dart';

class AddCartButton extends StatelessWidget {
  const AddCartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedGestureDetector(
      onTap: () => CardScanInit.navigate(context),
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
