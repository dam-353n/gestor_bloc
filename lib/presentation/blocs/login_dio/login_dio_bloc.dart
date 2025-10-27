import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestor_bloc/features/auth/data/auth_repository.dart';

part 'login_dio_event.dart';
part 'login_dio_state.dart';

class LoginDioBloc extends Bloc<LoginDioEvent, LoginDioState> {
  final AuthRepository _repository;

  LoginDioBloc(this._repository) : super(const LoginDioState()) {
    on<LoginDioSubmitted>(_onSubmitted);
  }

  Future<void> _onSubmitted(
    LoginDioSubmitted event,
    Emitter<LoginDioState> emit,
  ) async {
    

    try {
      emit(state.copyWith(status: LoginStatus.loading));

      final resp = await _repository.login(
        email: event.email,
        password: event.password,
      );

      if (resp['ok'] == true) {
        emit(state.copyWith(
          status: LoginStatus.success,
          user: Map<String, dynamic>.from(resp['user'] ?? {}),
          message: resp["data"]['message']?.toString(),
        ));
      } else {
        emit(state.copyWith(
          status: LoginStatus.failure,
          message: resp['message']?.toString() ?? 'Error al acceder',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: LoginStatus.failure,
        message: e.toString(),
      ));
    }
  }
}
