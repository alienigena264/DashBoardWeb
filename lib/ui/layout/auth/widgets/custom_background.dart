import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration('twitter-bg.png'),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        child: const Padding(
          padding:  EdgeInsets.symmetric(horizontal:30.0),
          child:  Center(
            child: Image(image: AssetImage("twitter-white-logo.png"),
            width: 400,),
          ),
        ),
      )
    );
  }

  BoxDecoration boxDecoration(String imageRoute) {
    return  BoxDecoration(
        image: DecorationImage(
            image: AssetImage(imageRoute),
            fit: BoxFit.cover)
      );
  }
}
