import 'package:admin_dashboard/providers/register_form_provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:provider/provider.dart';

import '../buttoms/custom_outline_buttom.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterFormProvider(),
      child: Builder(builder: (context) {
        final registerFormProvider =
            Provider.of<RegisterFormProvider>(context, listen: false);
        return Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: Colors.black,
          child: Center(
            child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 370),
                child: Form(
                  key: registerFormProvider.formKey ,
                  // autovalidateMode: AutovalidateMode.always,
                  child: Column(children: [
                    //Nombre
                    TextFormField(
                      onChanged: (value) => {
                        registerFormProvider.name = value,
                      } ,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingrese su nombre';
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: CustomInputs.logInInpuDecoration(
                          hint: "Ingrese su nombre",
                          label: "Nombre",
                          icon: Icons.person_outline),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //Correo
                    TextFormField(
                      onChanged: (value) => {
                        registerFormProvider.email = value,
                      },
                      validator: (value) {
                        if (EmailValidator.validate(value ?? '') == false) {
                          return 'Por favor, ingrese un correo válido';
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: CustomInputs.logInInpuDecoration(
                          hint: "Ingrese su correo",
                          label: "Correo",
                          icon: Icons.email_outlined),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //Contraseña
                    TextFormField(
                      onChanged: (value) => {
                        registerFormProvider.password = value,
                      },
                      obscureText: true,
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
                          hint: "********",
                          label: "Contraseña",
                          icon: Icons.lock_outline),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //BotónRegistrar
                    CustomOutlineButtom(
                      onPressed: registerFormProvider.validateForm,
                      text: 'Crear Cuenta'),
                    const SizedBox(
                      height: 20,
                    ),

                    //BotónIniciarSesión
                    FittedBox(
                      fit: BoxFit.contain,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "¿Ya tienes una cuenta?",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, Fluroroure.loginRoute);
                              },
                              child: const Text(
                                "Inicia Sesión",
                                style: TextStyle(color: Colors.blue),
                              ))
                        ],
                      ),
                    )
                  ]),
                )),
          ),
        );
      }),
    );
  }

  bool hasUppercase(String password) {
    // Define una expresión regular que busca letras mayúsculas en el password
    final regex = RegExp(r'[A-Z]');

    // Utiliza la expresión regular para buscar coincidencias en el password
    return regex.hasMatch(password);
  }
}
