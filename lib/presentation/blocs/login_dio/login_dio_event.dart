

part of 'login_dio_bloc.dart';

abstract class LoginDioEvent extends Equatable {
  const LoginDioEvent();

  @override
  List<Object?> get props => [];
}

class LoginDioSubmitted extends LoginDioEvent {
  final String email;
  final String password;

  const LoginDioSubmitted({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
  
