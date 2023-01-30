// coverage:ignore-file
part of solfacil_architecture_utils;

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
  const DefaultFailure()
      : super('Ocorreu um erro. Tente novamente mais tarde.');

  @override
  List<Object?> get props => [message];
}

class NullResponseFailure extends Failure {
  const NullResponseFailure() : super('');
}

class NoConnectionFailure extends Failure {
  const NoConnectionFailure()
      : super(
          'Sem conexão com a internet. Por favor, verifique sua conexão e tente novamente.',
        );

  @override
  List<Object?> get props => [message];
}
