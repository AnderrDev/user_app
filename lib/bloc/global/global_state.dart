part of 'global_bloc.dart';

class GlobalState {
  final bool isLoading;
  final bool isLoggedIn;
  GlobalState({
    this.isLoading = false,
    this.isLoggedIn = false,
  });

  GlobalState copyWith({
    bool? isLoading,
    bool? isLoggedIn,
  }) {
    return GlobalState(
      isLoading: isLoading ?? this.isLoading,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }
}
