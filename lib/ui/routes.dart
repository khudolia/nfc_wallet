part of 'app.dart';

Route<dynamic> _generateRoute(RouteSettings settings, BuildContext context) {
  switch (settings.name) {
    case '/':
    case MainScreen.routeName:
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => const MainScreen(),
      );
    case CardScanInit.routeName:
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => const CardScanInit(),
      );
    case CardDetailsInit.routeName:
      final args = settings.arguments as CardDetailsArgs;
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => CardDetailsInit(args: args),
      );
    default:
      throw ArgumentError.value(
        settings.name,
        'settings.name',
        'Unsupported route',
      );
  }
}
