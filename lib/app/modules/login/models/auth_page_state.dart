class AuthPageState {
  final PageStatus status;
  final String? message;

  AuthPageState({required this.status, this.message});

  factory AuthPageState.initial() {
    return AuthPageState(status: PageStatus.initial);
  }

  factory AuthPageState.loading() {
    return AuthPageState(status: PageStatus.loading);
  }

  factory AuthPageState.success(String message) {
    return AuthPageState(status: PageStatus.success, message: message);
  }

  factory AuthPageState.failed(String errorMessage) {
    return AuthPageState(status: PageStatus.error, message: errorMessage);
  }
}

enum PageStatus { initial, loading, success, error }
