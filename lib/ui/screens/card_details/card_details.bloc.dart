import 'package:flutter/material.dart';
import 'package:nfc_emulator/nfc_emulator.dart';
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

  void startEmulating() async {
    await NfcEmulator.startNfcEmulator("666B65630001", "cd22c716", "79e64d05ed6475d3acf405d6a9cd506b");

  }

  void stopEmulating() async {
    await NfcEmulator.stopNfcEmulator();

  }

  @override
  void dispose() {
    stopEmulating();
    super.dispose();
  }

  static CardDetailsBloc of(BuildContext context) =>
      ProviderService.of<CardDetailsBloc>(context);
}
