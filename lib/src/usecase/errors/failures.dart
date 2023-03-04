// coverage:ignore-file
part of clean_architecture_utils;

final _localizations = ModuleLocalizations().failures;

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);

  @override
  List<Object?> get props => [message];
}

class DefaultFailure extends Failure {
  static final _message = _localizations.defaultFailureMessage;
  DefaultFailure() : super(_message);

  @override
  List<Object?> get props => [message];
}

class NullResponseFailure extends Failure {
  const NullResponseFailure() : super('');
}

class NoConnectionFailure extends Failure {
  static final _message = _localizations.noConnectionFailureMessage;
  NoConnectionFailure() : super(_message);

  @override
  List<Object?> get props => [message];
}
