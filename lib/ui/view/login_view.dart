import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child:  Center(
        child: Text('Login view', style: GoogleFonts.montserrat(
          fontSize: 40,
          color: Colors.white
        ),),
      ),
    );
  }
}
