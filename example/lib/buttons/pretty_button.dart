import 'package:any_animated_button/any_animated_button.dart';
import 'package:example/consts/colors.dart';
import 'package:flutter/material.dart';

class PrettyButton extends CustomAnyAnimatedButton {
  PrettyButton({
    required this.onTap,
    required this.text,
    this.bloc,
  });

  @override
  final AnyAnimatedButtonBloc? bloc;
  final VoidCallback onTap;
  final String text;

  final BorderRadius _borderRadius = BorderRadius.circular(18.0);

  @override
  AnyAnimatedButtonParams get defaultParams => AnyAnimatedButtonParams(
        width: double.infinity,
        height: 56.0,
        decoration: BoxDecoration(
          color: CustomColors.navyBlue,
          borderRadius: _borderRadius,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: _borderRadius,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: const TextStyle(color: Colors.white),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  @override
  AnyAnimatedButtonParams get progressParams =>
      AnyAnimatedButtonParams.progress(
        backgroundColor: CustomColors.navyBlue,
      );

  @override
  AnyAnimatedButtonParams get errorParams => AnyAnimatedButtonParams.error(
        backgroundColor: CustomColors.red,
      );

  @override
  AnyAnimatedButtonParams get successParams => AnyAnimatedButtonParams.success(
        backgroundColor: CustomColors.green,
      );
}
