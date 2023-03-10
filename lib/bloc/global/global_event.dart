part of 'global_bloc.dart';

@immutable
abstract class GlobalEvent {}

class AuthTokenUser extends GlobalEvent {
  final String token;
  final BuildContext context;
  AuthTokenUser({
    required this.token,
    required this.context,
  });
}

class SignOut extends GlobalEvent {
  final BuildContext context;
  SignOut(this.context);
}

class RegisterUser extends GlobalEvent {
  final String email;
  final String password;
  final String name;
  final String lastname;
  final String birthdate;
  final BuildContext context;
  RegisterUser({
    required this.email,
    required this.password,
    required this.name,
    required this.lastname,
    required this.birthdate,
    required this.context,
  });
}

class LoginUser extends GlobalEvent {
  final BuildContext context;
  final String email;
  final String password;
  LoginUser({
    required this.context,
    required this.email,
    required this.password,
  });
}

class SetUser extends GlobalEvent {
  final dynamic user;
  SetUser(this.user);
}

class PostAddress extends GlobalEvent {
  final String address;
  final BuildContext context;
  PostAddress({
    required this.context,
    required this.address,
  });
}

class GetUser extends GlobalEvent {
  GetUser();
}
