import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:flutter/material.dart';

import '../buttoms/custom_outline_buttom.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.black,
      child: Center(
        child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 370),
            child: Form(
              child: Column(children: [
                TextFormField(
                  // validator: ,
                  style: const TextStyle(color: Colors.white),
                  decoration: CustomInputs.logInInpuDecoration(
                      hint: "Ingrese el correo",
                      label: "Email",
                      icon: Icons.email_outlined),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  // validator: ,
                  style: const TextStyle(color: Colors.white),
                  decoration: CustomInputs.logInInpuDecoration(
                      hint: "Ingrese la contraseña",
                      label: "*******",
                      icon: Icons.lock_outline),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomOutlineButtom(
                  text: 'Iniciar Sesión',
                ),
                const SizedBox(
                  height: 20,
                ),
                FittedBox(
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
                )
              ]),
            )),
      ),
    );
  }

}
