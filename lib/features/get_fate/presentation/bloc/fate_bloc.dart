import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:surf_practice_magic_ball/core/error/failures.dart';
import 'package:surf_practice_magic_ball/core/usecases/usecase.dart';

import '../../domain/entities/magic_ball_fate.dart';
import '../../domain/usecases/get_magic_ball_fate.dart';

part 'fate_event.dart';

part 'fate_state.dart';

class FateBloc extends Bloc<FateEvent, FateState> {
  final GetMagicBallFate getMagicBallFate;

  FateBloc({
    required GetMagicBallFate fate,
  })  : getMagicBallFate = fate,
        super(EmptyState()) {
    on<FateEvent>((event, emit) async {
      if (event is GetFateEvent) {
        emit(LoadingState());
        final failureOrTriviaR = await getMagicBallFate(NoParams());
        failureOrTriviaR.fold(
            (failure) =>
                emit(ErrorState(message: _mapFailureToMessage(failure))),
            (fate) => emit(LoadedState(fate: fate)));
      }
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      default:
        return 'Unexpected error';
    }
  }
}
