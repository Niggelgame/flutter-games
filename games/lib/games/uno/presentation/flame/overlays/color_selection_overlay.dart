import 'package:flutter/material.dart';
import 'package:games/games/uno/models/uno_card.dart';
import 'package:games/games/uno/presentation/flame/widgets/overlay_container.dart';

class ColorSelectionOverlay extends StatelessWidget {
  final void Function(UnoCardColor) onColorSelected;
  const ColorSelectionOverlay({
    Key? key,
    required this.onColorSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Material(
            color: Colors.transparent,
            child: OverlayContainer(
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  const Text(
                    'Select a color',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          onColorSelected(UnoCardColor.red);
                        },
                        child: Container(
                          width: 140,
                          height: 140,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(width: 25),
                      GestureDetector(
                        onTap: () {
                          onColorSelected(UnoCardColor.blue);
                        },
                        child: Container(
                          width: 140,
                          height: 140,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          onColorSelected(UnoCardColor.yellow);
                        },
                        child: Container(
                          width: 140,
                          height: 140,
                          color: Colors.yellow,
                        ),
                      ),
                      const SizedBox(width: 25),
                      GestureDetector(
                        onTap: () {
                          onColorSelected(UnoCardColor.green);
                        },
                        child: Container(
                          width: 140,
                          height: 140,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              height: 400,
              width: 400,
            ),
          ),
        ),
      ],
    );
  }
}

class ColorSelectingOverlay extends StatelessWidget {
  const ColorSelectingOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OverlayContainer(
      child: Center(
        child: Text(
          'Select a color',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      height: 300,
      width: 400,
    );
  }
}
