// lib/presentation/link/cubit/link_state.dart

sealed class LinkState {}

final class LinkInitial extends LinkState {}

final class LinkLoading extends LinkState {}

final class LinkSuccess extends LinkState {
  final String url;

  LinkSuccess(this.url);
}

final class LinkFailure extends LinkState {
  final String message;

  LinkFailure(this.message);
}