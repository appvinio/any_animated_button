import 'package:equatable/equatable.dart';
import 'package:example/consts/strings.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];

  String get errorMessage => Strings.error;
}

class DefaultFailure extends Failure {}
