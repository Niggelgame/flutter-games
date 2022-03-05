part of 'basic_game_state_bloc.dart';

abstract class BasicGameStateEvent extends Equatable {
  const BasicGameStateEvent();

  @override
  List<Object> get props => [];
}

class BasicGameStateEventStart extends BasicGameStateEvent {}

class BasicGameStateEventPlayerState extends BasicGameStateEvent {
  final SimpleGameState gameState;

  const BasicGameStateEventPlayerState(this.gameState);

  @override
  List<Object> get props => [gameState];
}
 