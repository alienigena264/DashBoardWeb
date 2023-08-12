import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class CustomOutlineButtom extends StatelessWidget {
  final String text;
  
  const CustomOutlineButtom({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 50,
      child: Expanded(
        child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.blue,
              backgroundColor: Colors.black,
              shape: const StadiumBorder(),
              side: const BorderSide(color: Colors.blue),
            ),
            onPressed: () {},
            child: Text(
              text,
              style: GoogleFonts.montserratAlternates(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.blue
              ),
            )),
      ),
    );
  }
}
