import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:games/base_pages/home/homepage.dart';
import 'package:games/game_base/client/game_client.dart';
import 'package:games/game_base/server/game_server.dart';
import 'package:games/games/test/testpage.dart';
import 'package:games/games/uno/game/player_event.dart';
import 'package:games/games/uno/game/server_event.dart';
import 'package:games/games/uno/game/uno_game.dart';
import 'package:games/games/uno/presentation/screens/test_uno_game_screen.dart';
import 'package:games/games/uno/presentation/screens/uno_game_page.dart';
import 'package:games/games/uno/presentation/screens/uno_home_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(page: HomePage, initial: true),
  AutoRoute(page: TestServerPage, path: '/test'),
  AutoRoute(page: TestNetworkClientPage, path: '/network'),
  AutoRoute(page: UnoHomePage, path: '/uno/home'),
  AutoRoute(page: UnoHostGamePage, path: '/uno/host'),
  AutoRoute(page: UnoJoinGamePage, path: '/uno/join/:id'),
  AutoRoute(page: TestUnoGameScreenPage, path: '/card'),
])
class AppRouter extends _$AppRouter {}
