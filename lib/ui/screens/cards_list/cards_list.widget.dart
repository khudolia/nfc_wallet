import 'package:flutter/material.dart';
import 'package:nfc_wallet/models/card.dart';
import 'package:nfc_wallet/ui/utils/rx_builder.dart';

import 'cards_list.bloc.dart';

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
          return const Center(child: Text("Empty"));
        }

        return Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: cards.map(
                  (e) => Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(e.name),
                  ),
                ).toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}