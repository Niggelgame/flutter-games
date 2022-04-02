import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:games/base_pages/home/homepage.dart';
import 'package:games/games/test/testpage.dart';
import 'package:games/games/uno/uno_game_page.dart';
import 'package:games/games/uno/uno_home_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(page: HomePage, initial: true),
  AutoRoute(page: TestServerPage, path: '/test'),
  AutoRoute(page: TestNetworkClientPage, path: '/network'),
  AutoRoute(page: UnoHomePage, path: '/uno/home'),
  AutoRoute(page: UnoJoinGamePage, path: '/uno/join/:id'),
  // AutoRoute(page: TestUnoGameScreenPage, path: '/card'),
])
class AppRouter extends _$AppRouter {}
