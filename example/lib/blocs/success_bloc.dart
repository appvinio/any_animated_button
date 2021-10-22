import 'package:any_animated_button/any_animated_button.dart';
import 'package:dartz/dartz.dart';
import 'package:example/failure.dart';

class SuccessBloc extends AnyAnimatedButtonBloc<int, double, Failure> {
  @override
  Future<Either<Failure, double>> asyncAction(int input) {
    return Future.delayed(
      const Duration(milliseconds: 2000),
      () => Right(input * 10.0),
    );
  }
}
