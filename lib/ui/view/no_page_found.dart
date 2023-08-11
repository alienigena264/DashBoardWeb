import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoPageFound extends StatelessWidget {
  const NoPageFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('No page found',
          style: GoogleFonts.montserratAlternates(
              fontSize: 40, color: Colors.red)),
    );
  }
}
