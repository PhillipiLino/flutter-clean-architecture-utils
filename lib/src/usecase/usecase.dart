library clean_architecture_utils;

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../failures.dart';

part 'adapters/dartz_either_adapter.dart';

abstract class Usecase<Output, Input> {
  Future<Either<Failure, Output>> call(Input params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
