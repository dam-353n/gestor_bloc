import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gestor_bloc/config/inputs/inputs.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState());

  void onSubmit() {
    emit(state.copyWith(
      formStatus: FormStatus.posting,
      username: state.username,
      email: Email.dirty(state.email.value),
      password: state.password,
      isValid: Formz.validate([state.email]),
    ));

    print(  'Creating account for: ${state.username}, ${state.email.value}, ${state.password}');
  }

  void updateUsername(String username) {
    emit(state.copyWith(username: username));
  }

  void updateEmail(String value) {
    final email = Email.dirty(value);

    emit(state.copyWith(
      email: email,
      isValid: Formz.validate([email]),
    ));
  }

  void updatePassword(String password) {
    emit(state.copyWith(password: password));
  }

}
