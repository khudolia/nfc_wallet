import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:nfc_wallet/models/card.dart';
import 'package:nfc_wallet/resources/constants.dart';
import 'package:path_provider/path_provider.dart';

class LocalRepository {
  late Box box;

  static init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    if(!Hive.isAdapterRegistered(ModelConstants.cardId))
      Hive.registerAdapter(CardModelAdapter());
  }

  @protected
  Future<void> initBox<E>(String box) async {
    this.box = await Hive.openBox<E>(box);
  }

  @protected
  getOpenedBox(String box) {
    return this.box;
  }

  @protected
  Future<void> addItem(dynamic key, dynamic object) async {
    await box.put(key, object);
  }

  @protected
  Future<void> updateItem(dynamic key, dynamic object) async {
    await box.put(key, object);
  }

  @protected
  dynamic getItem(dynamic key) {
    return box.get(key);
  }

  @protected
  List<dynamic> getAllItems() {
    return box.values.toList();
  }

  @protected
  Iterable<dynamic> getAllItemsIterable() {
    return box.values;
  }

  @protected
  Future<void> deleteItem(dynamic key) async {
    await box.delete(key);
  }
}