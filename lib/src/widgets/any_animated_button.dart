import 'package:any_animated_button/src/any_animated_button_params.dart';
import 'package:any_animated_button/src/blocs/any_animated_button_bloc/any_animated_button_bloc.dart';
import 'package:any_animated_button/src/widgets/any_not_animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnyAnimatedButton extends StatefulWidget {
  const AnyAnimatedButton({
    required this.bloc,
    required this.defaultButtonParams,
    this.progressButtonParams,
    this.successButtonParams,
    this.errorButtonParams,
    Key? key,
  }) : super(key: key);

  final AnyAnimatedButtonBloc bloc;
  final AnyAnimatedButtonParams defaultButtonParams;
  final AnyAnimatedButtonParams? progressButtonParams;
  final AnyAnimatedButtonParams? successButtonParams;
  final AnyAnimatedButtonParams? errorButtonParams;

  @override
  _AnyAnimatedButtonState createState() => _AnyAnimatedButtonState();
}

class _AnyAnimatedButtonState extends State<AnyAnimatedButton> {
  late AnyAnimatedButtonParams _progressParams;
  late AnyAnimatedButtonParams _successParams;
  late AnyAnimatedButtonParams _errorParams;
  late AnyAnimatedButtonParams _defaultParams;

  late double _maxHeight;
  late AnyAnimatedButtonParams _params;

  late final GlobalKey _key;

  @override
  void initState() {
    _defaultParams = widget.defaultButtonParams;
    _progressParams = widget.progressButtonParams ?? AnyAnimatedButtonParams.progress();
    _successParams = widget.successButtonParams ?? AnyAnimatedButtonParams.success();
    _errorParams = widget.errorButtonParams ?? AnyAnimatedButtonParams.error();

    _maxHeight = _getMaxHeight();
    _params = widget.defaultButtonParams;

    _key = GlobalKey();
    if (_defaultParams.width == null || _defaultParams.width!.isInfinite) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        setState(() {
          final RenderBox button = _key.currentContext!.findRenderObject() as RenderBox;
          _defaultParams = _defaultParams.copyWith(width: button.size.width);
        });
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _maxHeight,
      child: Center(
        child: BlocBuilder<AnyAnimatedButtonBloc, AnyAnimatedButtonState>(
          bloc: widget.bloc,
          builder: (BuildContext context, AnyAnimatedButtonState state) {
            _params = _getParamsFromState(state);

            return _defaultParams.width == null || _defaultParams.width!.isInfinite
                ? AnyNotAnimatedButton(params: _defaultParams.copyWith(key: _key))
                : AnimatedContainer(
                    height: _params.height,
                    key: _key,
                    alignment: _params.alignment,
                    padding: _params.padding,
                    color: _params.color,
                    decoration: _params.decoration,
                    foregroundDecoration: _params.foregroundDecoration,
                    width: _params.width ?? _defaultParams.width,
                    constraints: _params.constraints,
                    margin: _params.margin,
                    transform: _params.transform,
                    transformAlignment: _params.transformAlignment,
                    clipBehavior: _params.clipBehavior,
                    curve: _params.curve,
                    duration: _params.duration,
                    onEnd: _params.onEnd,
                    child: _params.child,
                  );
          },
        ),
      ),
    );
  }

  double _getMaxHeight() {
    double max = _defaultParams.height;
    if (max < _progressParams.height) {
      max = _progressParams.height;
    }
    if (max < _successParams.height) {
      max = _successParams.height;
    }
    if (max < _errorParams.height) {
      max = _errorParams.height;
    }
    return max;
  }

  AnyAnimatedButtonParams _getParamsFromState(AnyAnimatedButtonState state) {
    if (state is DefaultAnyAnimatedButtonState) {
      return widget.defaultButtonParams.copyWith(width: _defaultParams.width);
    } else if (state is ProgressAnyAnimatedButtonState) {
      return _progressParams;
    } else if (state is SuccessAnyAnimatedButtonState) {
      return _successParams;
    } else {
      return _errorParams;
    }
  }
}
