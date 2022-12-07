import 'package:flutter/material.dart';
import 'package:nfc_wallet/repositories/cards_list/cards_list.repository.dart';
import 'package:nfc_wallet/ui/screens/cards_list/cards_list.bloc.dart';
import 'package:nfc_wallet/ui/screens/cards_list/cards_list.widget.dart';
import 'package:nfc_wallet/ui/utils/bloc.dart';

class CardListInit extends StatelessWidget {
  const CardListInit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      blocBuilder: () {
        return CardsListBloc(CardsListRepository.of(context));
      },
      builder: (context, bloc) {
        return const CardsList();
      },
    );
  }
}
