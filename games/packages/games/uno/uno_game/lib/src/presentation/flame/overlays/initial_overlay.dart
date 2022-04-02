import 'package:flutter/material.dart';
import 'package:uno_game/src/game/states/games_state.dart';
import 'package:uno_game/src/game/states/player_state.dart';
import 'package:uno_game/src/presentation/flame/widgets/overlay_container.dart';

class InitialOverlay extends StatelessWidget {
  final Stream<PlayerState> playerStateStream;
  final Stream<String> gameCodeStream;
  final PlayerState? initialPlayerState;
  final String? initialGameCode;
  final void Function()? start;
  const InitialOverlay(
      {Key? key,
      required this.playerStateStream,
      required this.gameCodeStream,
      this.initialPlayerState,
      this.initialGameCode,
      this.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = (constraints.maxWidth * 0.7).clamp(0, 2000).toDouble();
      final height = (constraints.maxHeight * 0.7)
          .clamp(0, 2000 * (constraints.maxHeight / constraints.maxWidth))
          .toDouble();
      return Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Material(
              color: Colors.transparent,
              child: StreamBuilder<PlayerState>(
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return OverlayContainer(
                      height: height,
                      width: width,
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.orangeAccent, Colors.deepPurple],
                      ),
                      // backgroundColor: Colors.red,
                      child: const SizedBox.shrink(),
                    );
                  } else {
                    final playerState = snapshot.data;
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: playerState!.gameState != SimpleGameState.initial
                          ? Container()
                          : OverlayContainer(
                              height: height,
                              width: width,
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.orangeAccent,
                                  Colors.deepPurple
                                ],
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(height: 15),
                                  StreamBuilder(
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData) {
                                        return const SizedBox.shrink();
                                      }
                                      return Column(
                                        children: [
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Game Code: ${snapshot.data}',
                                            style: const TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                    stream: gameCodeStream,
                                    initialData: initialGameCode,
                                  ),
                                  Expanded(
                                    child: playerState.otherPlayers.isEmpty
                                        ? const Center(
                                            child: Text(
                                              'Waiting for other players...',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        : ListView.builder(
                                            itemBuilder: (context, index) {
                                              if (index == 0) {
                                                return ListTile(
                                                  title: Text(
                                                    '${playerState.name} (You)',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                );
                                              }
                                              return ListTile(
                                                title: Text(
                                                  playerState
                                                      .otherPlayers[index - 1]
                                                      .name,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              );
                                            },
                                            itemCount: playerState
                                                    .otherPlayers.length +
                                                1,
                                          ),
                                  ),
                                  const SizedBox(height: 20),
                                  start == null
                                      ? const Center(
                                          child: Text(
                                              'Awaiting Game Start... (Tell your host to press play)'),
                                        )
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            _StartButton(
                                                onPressed: start!,
                                                enabled: playerState
                                                    .otherPlayers.isNotEmpty),
                                          ],
                                        ),
                                  const SizedBox(height: 15),
                                ],
                              ),
                            ),
                    );
                  }
                },
                stream: playerStateStream,
                initialData: initialPlayerState,
              ),
            ),
          ),
        ],
      );
    });
  }
}

class _StartButton extends StatefulWidget {
  final VoidCallback onPressed;
  final bool enabled;
  const _StartButton({
    Key? key,
    required this.onPressed,
    required this.enabled,
  }) : super(key: key);

  @override
  State<_StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<_StartButton> {
  bool isHovered = false;
  bool isPressedDown = false;

  @override
  Widget build(BuildContext context) {
    final transform = isPressedDown
        ? (Matrix4.identity()..scale(0.85))
        : isHovered
            ? (Matrix4.identity()..scale(1.1))
            : Matrix4.identity();
    final baseColor = widget.enabled ? Colors.lightGreenAccent : Colors.grey;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = isPressedDown = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        onTapDown: (_) => setState(() => isPressedDown = true),
        onTapUp: (_) => setState(() => isPressedDown = false),
        child: AnimatedContainer(
          height: 100,
          width: 100,
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // borderRadius: BorderRadius.circular(500),
            border:
                Border.all(width: isPressedDown ? 8 : 3, color: Colors.white),
            color: isHovered
                ? baseColor.withOpacity(1)
                : baseColor.withOpacity(0.9),
          ),
          transform: transform,
          transformAlignment: Alignment.center,
          child: const Center(
            child: Text(
              'Play',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension ColorX on Color {
  MaterialStateProperty<Color?> toMaterialStateProperty() {
    return MaterialStateColor.resolveWith((states) => this);
  }
}
