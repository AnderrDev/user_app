part of 'global_bloc.dart';

class GlobalState {
  final dynamic user;
  GlobalState({
    this.user,
  });

  GlobalState copyWith({
    Map<String, dynamic>? user,
  }) {
    return GlobalState(
      user: user ?? this.user,
    );
  }
}
