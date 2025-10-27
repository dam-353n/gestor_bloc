import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestor_bloc/presentation/blocs/register/register_cubit.dart';
import 'package:gestor_bloc/presentation/widgets/inputs/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
          "Crear Cuenta",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(create: (context) => RegisterCubit(), child: _body()),
    );
  }
}

class _body extends StatelessWidget {
  const _body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(size: 100),
              const SizedBox(height: 40),
          
              const Text(
                'Comenzemos creando tu cuenta',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
          
              const SizedBox(height: 20),
          
              _RegisterForm(),
          
              
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm({
    super.key,
  });

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // String _email = '';
  // String _password = '';
  // String _username = '';



  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<RegisterCubit>();
    String username = cubit.state.username;
    final  email = cubit.state.email;
    String password = cubit.state.password;


    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            onChanged: (value){
              cubit.updateUsername(value);
              _formKey.currentState!.validate();
            },
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Por favor ingresa un nombre de usuario';
              }
              return null;
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Username',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 20),

          CustomTextFormField(hint: 'Correo electrónico',
            onChanged: cubit.updateEmail,
            errorMessage: email.errorMessage,),

          const SizedBox(height: 20),

          TextFormField(
            onChanged: (value) => cubit.updatePassword(value),
            obscureText: true,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Por favor ingresa una contraseña';
              }
              if ( value.length < 6 ) return 'Más de 6 letras';
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
      
              // Botón crear cuenta
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
                  onPressed: () {
                    cubit.onSubmit();
                    // Si el formulario es válido, puedes proceder con la creación de la cuenta
                    // Aquí puedes llamar a tu método de registro

                    
                  },
                  child: const Text(
                    "Crear cuenta",
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
