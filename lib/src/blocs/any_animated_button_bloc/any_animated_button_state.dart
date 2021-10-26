part of 'any_animated_button_bloc.dart';

abstract class AnyAnimatedButtonState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DefaultAnyAnimatedButtonState extends AnyAnimatedButtonState {
  @override
  List<Object?> get props => [];
}

abstract class ProgressAnyAnimatedButtonState extends AnyAnimatedButtonState {
  @override
  List<Object?> get props => [];
}

class ProgressAnimationStartsState extends ProgressAnyAnimatedButtonState {}

class ProgressAnimationEndsState extends ProgressAnyAnimatedButtonState {}

abstract class ErrorAnyAnimatedButtonState<Failure extends Object> extends AnyAnimatedButtonState {
  Failure get failure;

  @override
  List<Object?> get props => [failure];
}

class ErrorAnimationStartsState<Failure extends Object> extends ErrorAnyAnimatedButtonState<Failure> {
  ErrorAnimationStartsState(this.failure);

  @override
  final Failure failure;
}

class ErrorAnimationEndsState<Failure extends Object> extends ErrorAnyAnimatedButtonState<Failure> {
  ErrorAnimationEndsState(this.failure);

  @override
  final Failure failure;
}

abstract class SuccessAnyAnimatedButtonState<G extends Object> extends AnyAnimatedButtonState {
  G get object;

  @override
  List<Object?> get props => [object];
}

class SuccessAnimationStartsState<G extends Object> extends SuccessAnyAnimatedButtonState<G> {
  SuccessAnimationStartsState(this.object);

  @override
  final G object;
}

class SuccessAnimationEndsState<G extends Object> extends SuccessAnyAnimatedButtonState<G> {
  SuccessAnimationEndsState(this.object);

  @override
  final G object;
}
