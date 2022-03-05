import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:games/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.setLandscape();

  runApp(Games());
}

class Games extends StatelessWidget {
  Games({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
    );
  }
}
