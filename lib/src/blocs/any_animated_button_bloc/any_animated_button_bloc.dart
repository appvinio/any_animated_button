import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'any_animated_button_event.dart';

part 'any_animated_button_state.dart';

/// [Input] is type of input data, that bloc receives via [TriggerAnyAnimatedButtonEvent]
/// [Output] is type of output data that bloc returns via [SuccessAnyAnimatedButtonState]
/// [Failure] is type of error returned via [ErrorAnyAnimatedButtonState] when any error occurs during processing data
abstract class AnyAnimatedButtonBloc<Input extends Object,
        Output extends Object, Failure extends Object>
    extends Bloc<AnyAnimatedButtonEvent, AnyAnimatedButtonState> {
  AnyAnimatedButtonBloc({bool isDroppable = false}) : super(DefaultAnyAnimatedButtonState()) {
    on<TriggerAnyAnimatedButtonEvent<Input>>(_trigger, transformer: isDroppable ? droppable() : null);
  }

  final Duration _phaseDuration = const Duration(milliseconds: 600);

  Future _trigger(
    TriggerAnyAnimatedButtonEvent<Input> event,
    Emitter<AnyAnimatedButtonState> emit,
  ) async {
    emit(ProgressAnimationStartsState());
    final Either<Failure, Output> result = await asyncAction(event.object);
    await result.fold(
      (Failure failure) async {
        emit(ProgressAnimationEndsState());
        emit(ErrorAnimationStartsState(failure));
        await Future.delayed(_phaseDuration);
        emit(ErrorAnimationEndsState(failure));
      },
      (Output data) async {
        emit(ProgressAnimationEndsState());
        emit(SuccessAnimationStartsState(data));
        await Future.delayed(_phaseDuration);
        emit(SuccessAnimationEndsState(data));
      },
    );
    emit(DefaultAnyAnimatedButtonState());
  }

  Future<Either<Failure, Output>> asyncAction(Input input);
}
