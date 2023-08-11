import 'package:admin_dashboard/ui/layout/auth/widgets/custom_background.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body:  ListView(
        children: [
          //deskop
          _DesktopBody()
          //mobile
          //linkbar
        ],
      )
    );
  }
}

class _DesktopBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.red,
      child: Row(
        children: [
          //photo
          const CustomBackground(),
          Container(
            width: 600,
            height: double.infinity,
            color: Colors.green,
          )
        ]
      ),
    );
  }
}