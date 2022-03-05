part of 'basic_game_state_bloc.dart';

@freezed 
class BasicGameStateState with _$BasicGameStateState {
  factory BasicGameStateState.initial() = BasicGameStateInitial;
  factory BasicGameStateState.running() = BasicGameStateRunning;
  factory BasicGameStateState.finished() = BasicGameStateFinished;
}