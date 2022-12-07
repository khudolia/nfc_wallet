import 'package:flutter/widgets.dart';
import 'package:nfc_wallet/repositories/base/local_repository.dart';
import 'package:nfc_wallet/repositories/cards_list/cards_list.repository.dart';
import 'package:nfc_wallet/services/provider.service.dart';

/// Defines initialization builder syntax.
typedef InitializationBuilder = Widget Function(
  BuildContext context,
  String initialRoute,
);

/// Initializer of services and/or plugins that runs before app is started.
Future<void> preInitializer() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalRepository.init();

}

/// App-wide initializer of all services, repositories, plugins, etc.
class Initializer extends StatefulWidget {
  /// Constructs an instance of [Initializer].
  const Initializer({
    Key? key,
    required this.builder,
  }) : super(key: key);

  /// Called to obtain the child widget and determine initial route.
  ///
  /// This function is called whenever this widget is included in its parent's
  /// build and the old widget (if any) that it synchronizes with has a distinct
  /// object identity. Typically the parent's build method will construct
  /// a new tree of widgets and so a new Builder child will not be [identical]
  /// to the corresponding old one.
  final InitializationBuilder builder;

  @override
  _InitializerState createState() => _InitializerState();
}

class _InitializerState extends State<Initializer> {
  late CardsListRepository cardsListRepository;

  @override
  void initState() {
    cardsListRepository = CardsListRepository();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderService(
      data: <Type, dynamic>{
        CardsListRepository: cardsListRepository,
      },
      builder: (context) {
        return widget.builder(context, '/');
      },
    );
  }
}
