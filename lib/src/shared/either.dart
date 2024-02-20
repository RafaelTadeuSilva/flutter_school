abstract class Either<E extends Exception, S> {
  bool get isFailure => this is Failure<E, S>;

  bool get isSuccess => this is Success<E, S>;

  T fold<T>(T Function(E failure) fnL, T Function(S success) fnR);

  E get failure => this.fold<E>(
      (value) => value,
      (_) => throw Exception(
          'Illegal use. You should check isLeft before calling'));

  S get success => this.fold<S>(
      (_) => throw Exception(
          'Illegal use. You should check isRight before calling'),
      (value) => value);
}

class Failure<E extends Exception, S> extends Either<E, S> {
  final E exception;
  Failure(this.exception);

  @override
  T fold<T>(T Function(E left) fnL, T Function(S right) fnR) {
    return fnL(exception);
  }
}

class Success<E extends Exception, S> extends Either<E, S> {
  final S value;
  Success(this.value);

  @override
  T fold<T>(T Function(E left) fnL, T Function(S right) fnR) {
    return fnR(value);
  }
}
