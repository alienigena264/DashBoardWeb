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
                  decoration: buildInputDecoration(
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
                  decoration: buildInputDecoration(
                      hint: "Ingrese la contraseña",
                      label: "*******",
                      icon: Icons.lock_outline),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomOutlineButtom(),
              ]),
            )),
      ),
    );
  }

  InputDecoration buildInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white.withOpacity(0.3),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white.withOpacity(0.3),
        ),
      ),
      hintText: hint,
      labelText: label,
      prefixIcon: Icon(
        icon,
        color: Colors.white.withOpacity(0.3),
      ),
      labelStyle: const TextStyle(color: Colors.grey),
      hintStyle: const TextStyle(color: Colors.grey),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
    );
  }
}
