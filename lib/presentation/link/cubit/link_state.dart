sealed class LinkState {}

class LinkInitial extends LinkState {}

class LinkLoading extends LinkState {}

class LinkSuccess extends LinkState {
  final String summary;

  LinkSuccess(this.summary);
}

class LinkFailure extends LinkState {
  final String message;

  LinkFailure(this.message);
}