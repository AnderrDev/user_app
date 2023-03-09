part of 'global_bloc.dart';

@immutable
abstract class GlobalEvent {}

class SetIsLoading extends GlobalEvent {
  final bool isLoading;
  SetIsLoading(this.isLoading);
}

class AuthTokenUser extends GlobalEvent {
  final String token;
  AuthTokenUser(this.token);
}

class SignOut extends GlobalEvent {
  SignOut();
}

class SetIsLoggedIn extends GlobalEvent {
  final bool isLoggedIn;
  SetIsLoggedIn(this.isLoggedIn);
}
