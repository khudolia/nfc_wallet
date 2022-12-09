import 'package:flutter/material.dart';
import 'package:nfc_wallet/models/card.dart';
import 'package:nfc_wallet/repositories/cards_list/cards_list.repository.dart';
import 'package:nfc_wallet/ui/screens/card_details/card_details.bloc.dart';
import 'package:nfc_wallet/ui/screens/card_details/card_details.screen.dart';
import 'package:nfc_wallet/ui/utils/bloc.dart';

class CardDetailsArgs {
  const CardDetailsArgs(this.card);

  final CardModel card;
}

class CardDetailsInit extends StatelessWidget {
  const CardDetailsInit({Key? key, required this.args}) : super(key: key);

  static const routeName = '/card_details';
  final CardDetailsArgs args;

  static Future<void> navigate(BuildContext context, CardDetailsArgs args) =>
      Navigator.of(context).pushNamed(routeName, arguments: args);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      blocBuilder: () {
        return CardDetailsBloc(CardsListRepository.of(context), args.card);
      },
      builder: (context, bloc) {
        return const CardDetailsScreen();
      },
    );
  }
}
