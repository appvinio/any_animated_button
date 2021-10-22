import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'any_animated_button_event.dart';

part 'any_animated_button_state.dart';

abstract class AnyAnimatedButtonBloc<Receiving extends Object, Returning extends Object, Failure extends Object>
    extends Bloc<AnyAnimatedButtonEvent, AnyAnimatedButtonState> {
  AnyAnimatedButtonBloc() : super(DefaultAnyAnimatedButtonState());

  final Duration _phaseDuration = const Duration(milliseconds: 600);

  @override
  Stream<AnyAnimatedButtonState> mapEventToState(AnyAnimatedButtonEvent event) async* {
    if (event is TriggerAnyAnimatedButtonEvent<Receiving>) {
      yield* _trigger(event);
    } else {
      throw Exception('wrong invocation of AnyAnimatedBloc');
    }
  }

  Stream<AnyAnimatedButtonState> _trigger(TriggerAnyAnimatedButtonEvent<Receiving> event) async* {
    yield ProgressAnimationStartsState();
    final Either<Failure, Returning> result = await asyncAction(event.object);
    yield* result.fold(
      (Failure failure) async* {
        yield ProgressAnimationEndsState();
        yield ErrorAnimationStartsState(failure);
        await Future.delayed(_phaseDuration);
        yield ErrorAnimationEndsState(failure);
      },
      (Returning data) async* {
        yield ProgressAnimationEndsState();
        yield SuccessAnimationStartsState(data);
        await Future.delayed(_phaseDuration);
        yield SuccessAnimationEndsState(data);
      },
    );
    yield DefaultAnyAnimatedButtonState();
  }

  Future<Either<Failure, Returning>> asyncAction(Receiving input);
}
