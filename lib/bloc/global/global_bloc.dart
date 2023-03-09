
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'global_event.dart';
part 'global_state.dart';


class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  GlobalBloc() : super(GlobalState()) {
    on<GlobalEvent>((event, emit) {
      debugPrint('GlobalBloc: $event');
    });
  }
}