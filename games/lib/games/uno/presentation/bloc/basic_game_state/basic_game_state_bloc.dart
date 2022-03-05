import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:games/games/uno/game/states/games_state.dart';
import 'package:games/games/uno/presentation/bloc/repository/uno_repository.dart';

part 'basic_game_state_event.dart';
part 'basic_game_state_state.dart';
part 'basic_game_state_bloc.freezed.dart';

class BasicGameStateBloc extends Bloc<BasicGameStateEvent, BasicGameStateState> {
  final UnoRepository _repository;
  BasicGameStateBloc(this._repository) : super(BasicGameStateState.initial()) {
    on<BasicGameStateEventStart>(_start);
    on<BasicGameStateEventPlayerState>(_playerState);

    _repository.playerStateStream.listen((event) {
      add(BasicGameStateEventPlayerState(event.gameState));
     });
  }

  void _start(BasicGameStateEventStart event, _) {
    _repository.start();
  }

  void _playerState(BasicGameStateEventPlayerState event, emit) {
    if(event.gameState == SimpleGameState.initial && state is! BasicGameStateInitial) {
      emit(BasicGameStateState.initial());
    } else if(event.gameState == SimpleGameState.finished && state is! BasicGameStateFinished) {
      emit(BasicGameStateState.finished());
    } else if(state is! BasicGameStateRunning) {
      emit(BasicGameStateState.running());
    }
  }
}