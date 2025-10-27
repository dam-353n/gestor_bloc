part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterState extends Equatable {

  final FormStatus formStatus;
  final bool isValid;
  final String username;
  final Email email;
  final String password;

  const RegisterState({
    this.formStatus = FormStatus.invalid,
    this.isValid = false,
    this.username = '',
    this.email = const Email.pure(),
    this.password = '',
  });


  RegisterState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    String? username,
    Email? email,
    String? password,
  }) {
    return RegisterState(
      formStatus: formStatus ?? this.formStatus,
      isValid: isValid ?? this.isValid,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [formStatus, isValid, username, email, password];
}

