import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/login_form_provider.dart';

import 'package:email_validator/email_validator.dart';
import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/ui/buttoms/custom_outline_buttom.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = AuthProvider();
    return ChangeNotifierProvider(
        create: (_) => LoginFormProvider(),
        child: Builder(builder: (context) {
          final loginFormProvider =
              Provider.of<LoginFormProvider>(context, listen: false);

          return Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: Colors.black,
            child: Center(
              child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 370),
                  child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: loginFormProvider.formKey,
                    child: Column(children: [
                      //Email
                      TextFormField(
                        validator: (value) {
                          if (EmailValidator.validate(value ?? '') == false) {
                            return 'Por favor, ingrese un correo válido';
                          }
                          return null;
                        },
                        onChanged: (value) => loginFormProvider.email = value,
                        style: const TextStyle(color: Colors.white),
                        decoration: CustomInputs.logInInpuDecoration(
                            hint: "Ingrese el correo",
                            label: "Email",
                            icon: Icons.email_outlined),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      //Password
                      TextFormField(
                        obscureText: true,
                        onChanged: (value) =>
                            loginFormProvider.password = value,
                        validator: (value) {
                          // Si el password es vacío, retorna un error
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingrese una contraseña';
                          }
                          if (!hasUppercase(value)) {
                            return 'La contraseña debe contener al menos una letra mayúscula ';
                          }
                          if (value.length < 8) {
                            return 'La contraseña debe contener al menos 8 caracteres';
                          }
                          // Si la contraseña cumple con los requisitos, puedes retornar null
                          return null;
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: CustomInputs.logInInpuDecoration(
                          hint: "Ingrese la contraseña",
                          label: "*******",
                          icon: Icons.lock_outline,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      //Boton Iniciar Sesion
                      CustomOutlineButtom(
                        onPressed: () {
                          final isValid = loginFormProvider.validateForm();
                          if (isValid) {
                            authProvider.login(loginFormProvider.email,
                                loginFormProvider.password);
                          }
                        },
                        text: 'Iniciar Sesión',
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      //Boton Ir a Registro
                      const CambioView()
                    ]),
                  )),
            ),
          );
        }));
  }

  bool hasUppercase(String password) {
    // Define una expresión regular que busca letras mayúsculas en el password
    final regex = RegExp(r'[A-Z]');

    // Utiliza la expresión regular para buscar coincidencias en el password
    return regex.hasMatch(password);
  }
}

class CambioView extends StatelessWidget {
  const CambioView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "¿No tienes una cuenta?",
            style: TextStyle(color: Colors.white),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Fluroroure.registerRoute);
              },
              child: const Text(
                "Registrate",
                style: TextStyle(color: Colors.blue),
              ))
        ],
      ),
    );
  }
}
