import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestor_bloc/features/auth/data/auth_repository.dart';
import 'package:gestor_bloc/presentation/blocs/login_dio/login_dio_bloc.dart';

class LoginDioScreen extends StatelessWidget {
  const LoginDioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E100F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E100F),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Log in",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: MultiRepositoryProvider(
        providers: [RepositoryProvider(create: (_) => AuthRepository())],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (ctx) => LoginDioBloc(ctx.read<AuthRepository>()),
            ),
          ],
          child: const _LoginBody(),
        ),
      ),
    );
  }
}

class _LoginBody extends StatelessWidget {
  const _LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginDioBloc, LoginDioState>(
      listener: (context, state) {
        if (state.status == LoginStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message ?? 'Login exitoso')),
          );
          // Navega a home o regresa
          // Navigator.pop(context);
        } else if (state.status == LoginStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message ?? 'Error inesperado')),
          );
        }
      },
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                FlutterLogo(size: 100),
                SizedBox(height: 40),
                Text(
                  'Comencemos ingresando a tu cuenta', // “Comencemos” corregido
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),
                _RegisterForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm({super.key});

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Recomendado: usar controllers
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<LoginDioBloc>().state;
    final isLoading = state.status == LoginStatus.loading;

    return Form(
      key: _formKey,
      child: Column(
        children: [

          TextFormField(
            controller: _emailCtrl,
            validator: (value) {
              final v = value?.trim() ?? '';
              if (v.isEmpty) return 'Por favor ingresa un correo electrónico';
              final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!emailRegExp.hasMatch(v)) return 'No tiene formato de correo';
              return null;
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Correo Electrónico',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 20),

          TextFormField(
            controller: _passwordCtrl,
            obscureText: true,
            validator: (value) {
              final v = value ?? '';
              if (v.trim().isEmpty) return 'Por favor ingresa una contraseña';
              if (v.length < 6)
                return 'La contraseña debe tener al menos 6 caracteres';
              return null;
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Contraseña',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4ADE80),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: isLoading
                  ? () => {}
                  : () {
                      final valid = _formKey.currentState!.validate();
                      if (!valid) return;

                      context.read<LoginDioBloc>().add(
                        LoginDioSubmitted(
                          email: _emailCtrl.text.trim(),
                          password: _passwordCtrl.text,
                        ),
                      );
                    },
              child: isLoading
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.black,
                      ),
                    )
                  : const Text(
                      "Acceder",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
