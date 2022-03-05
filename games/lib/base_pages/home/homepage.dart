import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:games/routing/app_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Server'),
              onPressed: () {
                context.router.push(const TestServerRoute());
              },
            ),
            ElevatedButton(
              child: const Text('Client'),
              onPressed: () {
                context.router.push(const TestNetworkClientRoute());
              },
            ),
            ElevatedButton(
              child: const Text('UNO!!!'),
              onPressed: () {
                context.router.push(const UnoHomeRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
