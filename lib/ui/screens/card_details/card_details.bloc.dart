import 'package:flutter/material.dart';
import 'package:nfc_wallet/models/card.dart';
import 'package:nfc_wallet/repositories/cards_list/cards_list.repository.dart';
import 'package:nfc_wallet/services/provider.service.dart';
import 'package:nfc_wallet/ui/utils/bloc.dart';
import 'package:rxdart/rxdart.dart';

class CardDetailsBloc extends Bloc {
  CardDetailsBloc(this._cardsListRepository, CardModel card) {
    _card.add(card);
  }

  final CardsListRepository _cardsListRepository;

  final _card = BehaviorSubject<CardModel?>.seeded(null);

  ValueStream<CardModel?> get card => _card;

  void saveCard() {
    if(card.value == null) return;

    _cardsListRepository
        .addCard(card.value!);
  }

  static CardDetailsBloc of(BuildContext context) =>
      ProviderService.of<CardDetailsBloc>(context);
}
