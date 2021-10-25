import 'package:any_animated_button/src/any_animated_button_params.dart';
import 'package:any_animated_button/src/blocs/any_animated_button_bloc/any_animated_button_bloc.dart';
import 'package:any_animated_button/src/widgets/any_animated_button.dart';
import 'package:any_animated_button/src/widgets/any_not_animated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// If [bloc] is null, then this button will not animate, but act like a normal button, otherwise
/// it will be animated button.
///
/// [defaultParams] describes how the button will look in its default state.
///
/// [progressParams] describes how the button will look in progress state.
/// Defaults to [AnyAnimatedButtonParams.progress].
///
/// [successParams] describes how the button will look in success state.
/// Defaults to [AnyAnimatedButtonParams.success].
///
/// [errorParams] describes how the button will look in error state.
/// Defaults to [AnyAnimatedButtonParams.error].

abstract class CustomAnyAnimatedButton extends StatelessWidget {
  AnyAnimatedButtonBloc? get bloc;

  AnyAnimatedButtonParams get defaultParams;

  AnyAnimatedButtonParams get progressParams => AnyAnimatedButtonParams.progress();

  AnyAnimatedButtonParams get successParams => AnyAnimatedButtonParams.success();

  AnyAnimatedButtonParams get errorParams => AnyAnimatedButtonParams.error();

  @override
  Widget build(BuildContext context) {
    return bloc == null
        ? AnyNotAnimatedButton(params: defaultParams)
        : AnyAnimatedButton(
            bloc: bloc!,
            defaultButtonParams: defaultParams,
            progressButtonParams: progressParams,
            successButtonParams: successParams,
            errorButtonParams: errorParams,
          );
  }
}
