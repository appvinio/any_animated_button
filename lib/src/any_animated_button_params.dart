import 'package:flutter/material.dart';

class AnyAnimatedButtonParams {
  AnyAnimatedButtonParams({
    required this.height,
    this.key,
    this.alignment,
    this.padding,
    this.color,
    this.decoration,
    this.foregroundDecoration,
    this.width,
    this.constraints,
    this.margin,
    this.transform,
    this.transformAlignment,
    this.child = const SizedBox(),
    this.clipBehavior = Clip.none,
    this.curve = Curves.linear,
    this.duration = const Duration(milliseconds: 300),
    this.onEnd,
  })  : assert(margin == null || margin.isNonNegative),
        assert(padding == null || padding.isNonNegative),
        assert(decoration == null || decoration.debugAssertIsValid()),
        assert(
            color == null || decoration == null,
            'Cannot provide both a color and a decoration\n'
            'The color argument is just a shorthand for "decoration: BoxDecoration(color: color)".');

  /// Creates default look of progress button with customizable colors and sizes.
  factory AnyAnimatedButtonParams.progress({
    double? size,
    Color backgroundColor = Colors.blue,
    Color progressColor = Colors.white,
    EdgeInsets padding = const EdgeInsets.all(10.0),
    Duration duration = const Duration(milliseconds: 300),
  }) =>
      AnyAnimatedButtonParams(
        width: size ?? _size,
        height: size ?? _size,
        duration: duration,
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          color: backgroundColor,
        ),
        child: Center(
          child: Padding(
            padding: padding,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(progressColor),
              strokeWidth: 3.0,
            ),
          ),
        ),
      );

  /// Creates default look of success button with customizable colors and sizes.
  factory AnyAnimatedButtonParams.success({
    double? size,
    Color backgroundColor = Colors.green,
    Color iconColor = Colors.white,
    EdgeInsets padding = const EdgeInsets.all(8.0),
    Duration duration = const Duration(milliseconds: 300),
  }) =>
      AnyAnimatedButtonParams(
        width: size ?? _size,
        height: size ?? _size,
        duration: duration,
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          color: backgroundColor,
        ),
        child: Padding(
          padding: padding,
          child: Icon(
            Icons.check,
            color: iconColor,
          ),
        ),
      );

  /// Creates default look of error button with customizable colors and sizes.
  factory AnyAnimatedButtonParams.error({
    double? size,
    Color backgroundColor = Colors.red,
    Color iconColor = Colors.white,
    EdgeInsets padding = const EdgeInsets.all(8.0),
    Duration duration = const Duration(milliseconds: 300),
  }) =>
      AnyAnimatedButtonParams(
        width: size ?? _size,
        height: size ?? _size,
        duration: duration,
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          color: backgroundColor,
        ),
        child: Padding(
          padding: padding,
          child: Icon(
            Icons.close,
            color: iconColor,
          ),
        ),
      );

  static const double _size = 48.0;
  static const BorderRadius _borderRadius =
      BorderRadius.all(Radius.circular(45.0));

  /// All parameters that should be animated (i.e. colors, border radius, size) should be put directly in one
  /// of the corresponding fields. All of the other elements (i.e. Text, Icon) should be put
  /// inside the [child] field.
  final Key? key;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Decoration? decoration;
  final Decoration? foregroundDecoration;
  final double? width;
  final double height;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? margin;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;
  final Widget? child;
  final Clip clipBehavior;
  final Curve curve;
  final Duration duration;
  final VoidCallback? onEnd;

  AnyAnimatedButtonParams copyWith({
    Key? key,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    Color? color,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    double? width,
    double? height,
    EdgeInsetsGeometry? margin,
    Matrix4? transform,
    Widget? child,
  }) {
    return AnyAnimatedButtonParams(
      key: key ?? this.key,
      alignment: alignment ?? this.alignment,
      padding: padding ?? this.padding,
      color: color ?? this.color,
      decoration: decoration ?? this.decoration,
      foregroundDecoration: foregroundDecoration ?? this.foregroundDecoration,
      width: width ?? this.width,
      height: height ?? this.height,
      margin: margin ?? this.margin,
      transform: transform ?? this.transform,
      child: child ?? this.child,
    );
  }
}
