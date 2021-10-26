import 'package:any_animated_button/any_animated_button.dart';
import 'package:dartz/dartz.dart';
import 'package:example/failure.dart';

class ShortBloc extends AnyAnimatedButtonBloc<int, String, Failure> {
  @override
  Future<Either<Failure, String>> asyncAction(int input) {
    return Future.delayed(
      const Duration(milliseconds: 50),
      () => Left(DefaultFailure()),
    );
  }
}
