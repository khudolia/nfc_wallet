import 'package:flutter/material.dart';
import 'package:nfc_wallet/models/card.dart';
import 'package:nfc_wallet/repositories/base/local_repository.dart';
import 'package:nfc_wallet/resources/constants.dart';
import 'package:nfc_wallet/services/provider.service.dart';
import 'package:rxdart/rxdart.dart';

class CardsListRepository extends LocalRepository {
  CardsListRepository() {
    initRepo();
  }

  final _cards = BehaviorSubject<List<CardModel>?>.seeded(null);

  ValueStream<List<CardModel>?> get cards => _cards;

  Future<void> initRepo() async {
    await initBox<CardModel>(Repo.cards);

    _cards.add(getAllCards());
  }

  addCard(CardModel card) => addItem(card.id, card);

  removeCard(String id) => deleteItem(id);

  updateCard(CardModel card) => updateItem(card.id, card);

  List<CardModel>? getAllCards() {
    _cards.add(getAllItems() as List<CardModel>);

    return _cards.value;
  }

  static CardsListRepository of(BuildContext context) =>
      ProviderService.of<CardsListRepository>(context);
}
