import 'package:any_animated_button/src/blocs/any_animated_button_bloc/any_animated_button_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef SuccessCallback<T extends Object> = void Function(T data);
typedef ErrorCallback<Failure extends Object> = void Function(Failure failure);

/// T is type of data returned from any animated button bloc
/// Failure is type of data returned form any animated button bloc
class AnyAnimatedButtonBlocListener<T extends Object, Failure extends Object>
    extends BlocListener<AnyAnimatedButtonBloc, AnyAnimatedButtonState> {
  AnyAnimatedButtonBlocListener({
    required AnyAnimatedButtonBloc bloc,
    VoidCallback? onDefault,
    VoidCallback? onProgressStart,
    VoidCallback? onProgressEnd,
    SuccessCallback<T>? onSuccessStart,
    SuccessCallback<T>? onSuccessEnd,
    ErrorCallback<Failure>? onErrorStart,
    ErrorCallback<Failure>? onErrorEnd,
  }) : super(
          bloc: bloc,
          listener: (BuildContext context, AnyAnimatedButtonState state) {
            if (state is DefaultAnyAnimatedButtonState) {
              if (onDefault != null) {
                onDefault();
              }
            } else if (state is ProgressAnimationStartsState) {
              if (onProgressStart != null) {
                onProgressStart();
              }
            } else if (state is ProgressAnimationEndsState) {
              if (onProgressEnd != null) {
                onProgressEnd();
              }
            } else if (state is SuccessAnimationStartsState<T>) {
              if (onSuccessStart != null) {
                onSuccessStart(state.object);
              }
            } else if (state is SuccessAnimationEndsState<T>) {
              if (onSuccessEnd != null) {
                onSuccessEnd(state.object);
              }
            } else if (state is ErrorAnimationStartsState<Failure>) {
              if (onErrorStart != null) {
                onErrorStart(state.failure);
              }
            } else if (state is ErrorAnimationEndsState<Failure>) {
              if (onErrorEnd != null) {
                onErrorEnd(state.failure);
              }
            }
          },
        );
}
