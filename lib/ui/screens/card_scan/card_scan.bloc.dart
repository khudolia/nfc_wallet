import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_wallet/services/provider.service.dart';
import 'package:nfc_wallet/ui/utils/bloc.dart';
import 'package:rxdart/rxdart.dart';

class CardScanBloc extends Bloc {

  CardScanBloc() {
    startReading();
  }

  final _hex = BehaviorSubject<String>.seeded("");

  ValueStream<String> get hex => _hex;


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
        _hex.add(tag.handle);
      },
    );
  }

  static CardScanBloc of(BuildContext context) =>
      ProviderService.of<CardScanBloc>(context);
}
