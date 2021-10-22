import 'package:any_animated_button/any_animated_button.dart';
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
          color: const Color(0xff073b4c),
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
  AnyAnimatedButtonParams get progressParams => AnyAnimatedButtonParams.progress(
        backgroundColor: const Color(0xff073b4c),
      );

  @override
  AnyAnimatedButtonParams get errorParams => AnyAnimatedButtonParams.error(
        backgroundColor: const Color(0xffef476f),
      );

  @override
  AnyAnimatedButtonParams get successParams => AnyAnimatedButtonParams.success(
        backgroundColor: const Color(0xff06d6a0),
      );
}
