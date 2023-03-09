import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:user_app/services/api_service.dart';
import 'package:user_app/services/storage_service.dart';

part 'global_event.dart';
part 'global_state.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  GlobalBloc() : super(GlobalState()) {
    on<SetIsLoading>((event, emit) async {
      _setIsLoading(event, emit);
    });
    on<AuthTokenUser>((event, emit) async {
      _authTokenUser(event, emit);
    });
    on<SignOut>((event, emit) async {
      _signOut(event, emit);
    });
  }

  void _setIsLoading(event, emit) async {
    debugPrint('SetIsLoading Bloc');
    emit(state.copyWith(isLoading: event.isLoading));
  }

  void _authTokenUser(event, emit) async {
    debugPrint('AuthTokenUser Bloc');

    debugPrint('AuthTokenUser: ${event.token}');
    // Pedir el usuario users/me con bearer token peticion get
    // Si existe el usuario
    // Setea usuario en el state
    dynamic data;
    try {
      final dynamic response = await ApiService.getHttp(
        'users/me',
        token: event.token,
      );
      debugPrint('response body: ${response.data}');
      data = jsonDecode(response.data);
    } catch (e) {
      debugPrint('error: $e');
    }

    debugPrint('data: $data');
    // Si existe el token
    if (data['id'] != null) {
      // Setea token en el storage
      await StorageService.setProperty('token', event.token);
      // Setea usuario en el state
      emit(state.copyWith(isLoggedIn: true));
      // TODO: Llamar logica que trae los datos del usuario del api
    } else {
      // No se pudo loguear el usuario
      add(SetIsLoggedIn(false));
      await StorageService.deleteProperty('token');
    }
    add(SetIsLoading(false));
  }

  void _signOut(event, emit) async {
    debugPrint('SignOut Bloc');
    await StorageService.deleteProperty('token');
    // Agregar un nuevo estado vacio con la propiedad isLoggedIn en false
    add(SetIsLoading(false));
  }
}
