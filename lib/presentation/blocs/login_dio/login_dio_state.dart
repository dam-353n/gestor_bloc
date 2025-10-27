part of 'login_dio_bloc.dart';

enum LoginStatus { initial, loading, success, failure }

class LoginDioState extends Equatable {
  final LoginStatus status;
  final String? message; // error o success msg
  final Map<String, dynamic>? user; // datos retornados

  const LoginDioState({
    this.status = LoginStatus.initial,
    this.message,
    this.user,
  });

  LoginDioState copyWith({
    LoginStatus? status,
    String? message,
    Map<String, dynamic>? user,
  }) {
    return LoginDioState(
      status: status ?? this.status,
      message: message ?? this.message,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [status, message, user];
}
