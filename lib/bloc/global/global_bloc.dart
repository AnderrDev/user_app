import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:user_app/services/api_service.dart';
import 'package:user_app/services/storage_service.dart';

part 'global_event.dart';
part 'global_state.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  GlobalBloc() : super(GlobalState()) {
    on<AuthTokenUser>((event, emit) async {
      _authTokenUser(event, emit);
    });
    on<SignOut>((event, emit) async {
      _signOut(event, emit);
    });
    on<RegisterUser>((event, emit) async {
      _registerUser(event, emit);
    });
    on<LoginUser>((event, emit) async {
      _loginUser(event, emit);
    });
    on<SetUser>((event, emit) async {
      _setUser(event, emit);
    });
    on<PostAddress>((event, emit) async {
      _postAddress(event, emit);
    });
    on<GetUser>((event, emit) async {
      _getUser(event, emit);
    });
  }

  void _getUser(event, emit) async {
    String? token = await StorageService.getProperty('token');
    dynamic filter = {
      'include': [
        {
          'relation': 'addresses',
          'scope': {
            'where': {
              'deletedAt': {
                'inq': [null],
              }
            },
          }
        },
      ],
      'where': {'id': state.user['id']},
    };

    try {
      final ApiResponse response = await ApiService.getHttp(
        'users',
        token: token,
        filter: filter,
      );
      dynamic data = jsonDecode(response.data);
      add(SetUser(data[0]));
    } catch (e) {
      debugPrint('error: $e');
    }
  }

  void _postAddress(event, emit) async {
    String? token = await StorageService.getProperty(
      'token',
    );
    String body = jsonEncode({
      'name': event.address,
      'userId': state.user['id'],
    });
    try {
      // ignore: unused_local_variable
      final ApiResponse response = await ApiService.postHttp(
        'addresses',
        body,
        token: token,
      );
    } catch (e) {
      debugPrint('error: $e');
    }
    add(GetUser());
  }

  void _setUser(event, emit) async {
    debugPrint('SetUser Bloc');
    emit(state.copyWith(
      user: event.user,
    ));
  }

  void _signOut(event, emit) async {
    await StorageService.deleteProperty('token');
    add(SetUser(null));
    Navigator.pushReplacementNamed(event.context, '/login');
  }

  void _registerUser(event, emit) async {
    Map body = {
      'name': event.name,
      'lastname': event.lastname,
      'password': event.password,
      'username': event.email,
      'birthdate': () {
        final List<String> date = event.birthdate.split('/');
        return DateTime(
          int.parse(date[2]),
          int.parse(date[1]),
          int.parse(date[0]),
        ).toIso8601String();
      }()
    };
    int? status;
    try {
      final dynamic response =
          await ApiService.postHttp('users', jsonEncode(body));
      status = response.status;
    } catch (e) {
      debugPrint('error: $e');
      ScaffoldMessenger.of(event.context).showSnackBar(
        const SnackBar(
          content: Text('Failed to register user'),
        ),
      );
    }

    if (status != null && status >= 200 && status < 300) {
      ScaffoldMessenger.of(event.context).showSnackBar(
        const SnackBar(
          content: Text('User successfully registered'),
        ),
      );
      add(LoginUser(
        context: event.context,
        email: event.email,
        password: event.password,
      ));
    } else {
      ScaffoldMessenger.of(event.context).showSnackBar(
        const SnackBar(
          content:
              Text('Failed to register the user, check the data and try again'),
        ),
      );
    }
  }

  _loginUser(event, emit) async {
    Map body = {
      'password': event.password,
      'username': event.email,
    };
    dynamic data;
    int? status;
    try {
      final dynamic response =
          await ApiService.postHttp('users/login', jsonEncode(body));
      data = jsonDecode(response.data);
      status = response.status;
    } catch (e) {
      debugPrint('error: $e');
      ScaffoldMessenger.of(event.context).showSnackBar(
        const SnackBar(
          content: Text('Error al iniciar sesión'),
        ),
      );
    }
    if (status != null && status >= 200 && status < 300) {
      await StorageService.setProperty('token', data['token']);
      add(AuthTokenUser(context: event.context, token: data['token']));
      Navigator.pushReplacementNamed(event.context, '/home');
    } else {
      ScaffoldMessenger.of(event.context).showSnackBar(
        const SnackBar(
          content: Text(
            'Failed to log in, please check the data and try again',
          ),
        ),
      );
    }
  }

  void _authTokenUser(event, emit) async {
    dynamic data;
    try {
      final dynamic response = await ApiService.getHttp(
        'users/me',
        token: event.token,
      );
      data = jsonDecode(response.data);
    } catch (e) {
      debugPrint('error: $e');
    }
    if (data['id'] != null) {
      await StorageService.setProperty('token', event.token);
      add(SetUser(data));
      add(GetUser());
    } else {
      await StorageService.deleteProperty('token');
    }
  }
}
