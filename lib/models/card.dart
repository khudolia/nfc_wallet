import 'package:hive/hive.dart';
import 'package:nfc_wallet/resources/constants.dart';
import 'package:uuid/uuid.dart';

part 'card.g.dart';

@HiveType(typeId: ModelConstants.cardId)
class CardModel {
  CardModel(this.name, this.hexData);

  @HiveField(0)
  final String id = const Uuid().v1();

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String hexData;
}
