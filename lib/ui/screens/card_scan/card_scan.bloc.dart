import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_wallet/models/card.dart';
import 'package:nfc_wallet/repositories/cards_list/cards_list.repository.dart';
import 'package:nfc_wallet/services/provider.service.dart';
import 'package:nfc_wallet/ui/utils/bloc.dart';
import 'package:rxdart/rxdart.dart';

class CardScanBloc extends Bloc {
  CardScanBloc(this._cardsListRepository) {
    startReading();
  }

  final CardsListRepository _cardsListRepository;

  final _card = BehaviorSubject<CardModel?>.seeded(null);

  ValueStream<CardModel?> get card => _card;

  @override
  void dispose() {
    NfcManager.instance.stopSession();

    super.dispose();
  }

  void startReading() {
    // FlutterNfcReader.read().then((response) {
    // });

    NfcManager.instance.startSession(
      onDiscovered: (NfcTag tag) async {
        _card.add(CardModel(DateTime.now().toString(), tag.handle, tag.data));
      },
    );
  }

  void saveCard() {
    if (card.value == null) return;

    _cardsListRepository.addCard(card.value!);
  }

  static CardScanBloc of(BuildContext context) =>
      ProviderService.of<CardScanBloc>(context);
}
