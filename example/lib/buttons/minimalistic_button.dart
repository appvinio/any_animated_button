import 'package:any_animated_button/any_animated_button.dart';
import 'package:flutter/material.dart';

class MinimalisticButton extends CustomAnyAnimatedButton {
  MinimalisticButton({
    required this.onTap,
    required this.text,
    this.enabled = true,
    this.width,
    this.bloc,
  });

  @override
  final AnyAnimatedButtonBloc? bloc;
  final VoidCallback onTap;
  final String text;
  final bool enabled;
  final double? width;

  final BorderRadius _borderRadius = BorderRadius.circular(22.0);

  @override
  AnyAnimatedButtonParams get defaultParams => AnyAnimatedButtonParams(
        width: width,
        height: 56.0,
        decoration: BoxDecoration(
          color: enabled ? Colors.blue : Colors.grey,
          borderRadius: _borderRadius,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: enabled ? onTap : null,
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
}
