import 'package:animated_gesture_detector/animated_gesture_detector.dart';
import 'package:flutter/material.dart';
import 'package:nfc_wallet/models/card.dart';
import 'package:nfc_wallet/ui/screens/card_details/card_details.init.dart';
import 'package:nfc_wallet/ui/utils/rx_builder.dart';

import 'cards_list.bloc.dart';
import 'widgets/add_card.button.dart';

class CardsList extends StatelessWidget {
  const CardsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RxBuilder<List<CardModel>?>(
      stream: CardsListBloc.of(context).cards,
      builder: (context, sCards) {
        final cards = sCards.data;

        if (cards == null) {
          return const Center(child: Text("Loading..."));
        }
        if (cards.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text("Empty"),
                AddCartButton(),
              ],
            ),
          );
        }

        return Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                child: Column(
                  children: cards
                      .map(
                        (e) => AnimatedGestureDetector(
                          onTap: () => CardDetailsInit.navigate(
                            context,
                            CardDetailsArgs(e),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 40),
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Center(child: Text(e.name)),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            const Positioned(
              right: 25,
              bottom: 25,
              child: AddCartButton(),
            ),
          ],
        );
      },
    );
  }
}
