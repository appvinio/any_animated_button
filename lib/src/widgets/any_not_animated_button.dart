import 'package:any_animated_button/src/any_animated_button_params.dart';
import 'package:flutter/material.dart';

class AnyNotAnimatedButton extends StatelessWidget {
  const AnyNotAnimatedButton({
    required this.params,
    Key? key,
  }) : super(key: key);

  final AnyAnimatedButtonParams params;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: params.key,
      width: params.width,
      height: params.height,
      alignment: params.alignment,
      padding: params.padding,
      margin: params.margin,
      decoration: params.decoration,
      foregroundDecoration: params.foregroundDecoration,
      transform: params.transform,
      color: params.color,
      child: params.child,
    );
  }
}
