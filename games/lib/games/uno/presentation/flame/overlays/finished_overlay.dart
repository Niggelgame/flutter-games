import 'package:flutter/material.dart';

class FinishedOverlay extends StatelessWidget {
  const FinishedOverlay({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
        ),
        child: const Text('Game Over!'),
      ),
    );
  }
}