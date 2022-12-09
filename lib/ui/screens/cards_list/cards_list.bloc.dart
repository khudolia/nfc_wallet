import 'package:flutter/material.dart';
import 'package:nfc_wallet/models/card.dart';
import 'package:nfc_wallet/repositories/cards_list/cards_list.repository.dart';
import 'package:nfc_wallet/services/provider.service.dart';
import 'package:nfc_wallet/ui/utils/bloc.dart';
import 'package:rxdart/rxdart.dart';

class CardsListBloc extends Bloc {
  CardsListBloc(this._cardsListRepository);

  final CardsListRepository _cardsListRepository;

  ValueStream<List<CardModel>?> get cards => _cardsListRepository.cards;

  void getCards() {
    _cardsListRepository.getAllCards();
  }

  @override
  void dispose() {
    super.dispose();
  }

  static CardsListBloc of(BuildContext context) =>
      ProviderService.of<CardsListBloc>(context);
}
