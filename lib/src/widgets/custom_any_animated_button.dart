import 'package:any_animated_button/src/any_animated_button_params.dart';
import 'package:any_animated_button/src/blocs/any_animated_button_bloc/any_animated_button_bloc.dart';
import 'package:any_animated_button/src/widgets/any_animated_button.dart';
import 'package:any_animated_button/src/widgets/any_not_animated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
