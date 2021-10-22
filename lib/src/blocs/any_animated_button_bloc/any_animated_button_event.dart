part of 'any_animated_button_bloc.dart';

abstract class AnyAnimatedButtonEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class TriggerAnyAnimatedButtonEvent<T extends Object> extends AnyAnimatedButtonEvent {
  TriggerAnyAnimatedButtonEvent(this.object);

  final T object;

  @override
  List<Object?> get props => [object];
}
