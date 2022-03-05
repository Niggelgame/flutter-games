// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    TestServerRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const TestServerPage());
    },
    TestNetworkClientRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const TestNetworkClientPage());
    },
    UnoHomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const UnoHomePage());
    },
    UnoHostGameRoute.name: (routeData) {
      final args = routeData.argsAs<UnoHostGameRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: UnoHostGamePage(
              key: args.key,
              gameServer: args.gameServer,
              gameClient: args.gameClient));
    },
    UnoJoinGameRoute.name: (routeData) {
      final args = routeData.argsAs<UnoJoinGameRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: UnoJoinGamePage(
              key: args.key,
              sessionCode: args.sessionCode,
              gameClient: args.gameClient));
    },
    TestUnoGameScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const TestUnoGameScreenPage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(HomeRoute.name, path: '/'),
        RouteConfig(TestServerRoute.name, path: '/test'),
        RouteConfig(TestNetworkClientRoute.name, path: '/network'),
        RouteConfig(UnoHomeRoute.name, path: '/uno/home'),
        RouteConfig(UnoHostGameRoute.name, path: '/uno/host'),
        RouteConfig(UnoJoinGameRoute.name, path: '/uno/join/:id'),
        RouteConfig(TestUnoGameScreenRoute.name, path: '/card')
      ];
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [TestServerPage]
class TestServerRoute extends PageRouteInfo<void> {
  const TestServerRoute() : super(TestServerRoute.name, path: '/test');

  static const String name = 'TestServerRoute';
}

/// generated route for
/// [TestNetworkClientPage]
class TestNetworkClientRoute extends PageRouteInfo<void> {
  const TestNetworkClientRoute()
      : super(TestNetworkClientRoute.name, path: '/network');

  static const String name = 'TestNetworkClientRoute';
}

/// generated route for
/// [UnoHomePage]
class UnoHomeRoute extends PageRouteInfo<void> {
  const UnoHomeRoute() : super(UnoHomeRoute.name, path: '/uno/home');

  static const String name = 'UnoHomeRoute';
}

/// generated route for
/// [UnoHostGamePage]
class UnoHostGameRoute extends PageRouteInfo<UnoHostGameRouteArgs> {
  UnoHostGameRoute(
      {Key? key,
      required GameServer<UnoPlayerEvent, UnoServerEvent, UnoGame> gameServer,
      required GameClient<UnoPlayerEvent, UnoServerEvent, UnoGame> gameClient})
      : super(UnoHostGameRoute.name,
            path: '/uno/host',
            args: UnoHostGameRouteArgs(
                key: key, gameServer: gameServer, gameClient: gameClient));

  static const String name = 'UnoHostGameRoute';
}

class UnoHostGameRouteArgs {
  const UnoHostGameRouteArgs(
      {this.key, required this.gameServer, required this.gameClient});

  final Key? key;

  final GameServer<UnoPlayerEvent, UnoServerEvent, UnoGame> gameServer;

  final GameClient<UnoPlayerEvent, UnoServerEvent, UnoGame> gameClient;

  @override
  String toString() {
    return 'UnoHostGameRouteArgs{key: $key, gameServer: $gameServer, gameClient: $gameClient}';
  }
}

/// generated route for
/// [UnoJoinGamePage]
class UnoJoinGameRoute extends PageRouteInfo<UnoJoinGameRouteArgs> {
  UnoJoinGameRoute(
      {Key? key,
      required String sessionCode,
      required GameClient<UnoPlayerEvent, UnoServerEvent, UnoGame> gameClient})
      : super(UnoJoinGameRoute.name,
            path: '/uno/join/:id',
            args: UnoJoinGameRouteArgs(
                key: key, sessionCode: sessionCode, gameClient: gameClient),
            rawPathParams: {'id': sessionCode});

  static const String name = 'UnoJoinGameRoute';
}

class UnoJoinGameRouteArgs {
  const UnoJoinGameRouteArgs(
      {this.key, required this.sessionCode, required this.gameClient});

  final Key? key;

  final String sessionCode;

  final GameClient<UnoPlayerEvent, UnoServerEvent, UnoGame> gameClient;

  @override
  String toString() {
    return 'UnoJoinGameRouteArgs{key: $key, sessionCode: $sessionCode, gameClient: $gameClient}';
  }
}

/// generated route for
/// [TestUnoGameScreenPage]
class TestUnoGameScreenRoute extends PageRouteInfo<void> {
  const TestUnoGameScreenRoute()
      : super(TestUnoGameScreenRoute.name, path: '/card');

  static const String name = 'TestUnoGameScreenRoute';
}
