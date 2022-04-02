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
    UnoJoinGameRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<UnoJoinGameRouteArgs>(
          orElse: () =>
              UnoJoinGameRouteArgs(sessionCode: pathParams.getString('id')));
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: UnoJoinGamePage(
              key: args.key, sessionCode: args.sessionCode, name: args.name));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(HomeRoute.name, path: '/'),
        RouteConfig(TestServerRoute.name, path: '/test'),
        RouteConfig(TestNetworkClientRoute.name, path: '/network'),
        RouteConfig(UnoHomeRoute.name, path: '/uno/home'),
        RouteConfig(UnoJoinGameRoute.name, path: '/uno/join/:id')
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
/// [UnoJoinGamePage]
class UnoJoinGameRoute extends PageRouteInfo<UnoJoinGameRouteArgs> {
  UnoJoinGameRoute({Key? key, required String sessionCode, String? name})
      : super(UnoJoinGameRoute.name,
            path: '/uno/join/:id',
            args: UnoJoinGameRouteArgs(
                key: key, sessionCode: sessionCode, name: name),
            rawPathParams: {'id': sessionCode});

  static const String name = 'UnoJoinGameRoute';
}

class UnoJoinGameRouteArgs {
  const UnoJoinGameRouteArgs({this.key, required this.sessionCode, this.name});

  final Key? key;

  final String sessionCode;

  final String? name;

  @override
  String toString() {
    return 'UnoJoinGameRouteArgs{key: $key, sessionCode: $sessionCode, name: $name}';
  }
}
