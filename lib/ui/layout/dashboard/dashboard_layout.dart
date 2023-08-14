import 'package:flutter/material.dart';

class DashboardLayout extends StatelessWidget {
  final Widget child;
  const DashboardLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.red,
          child:const  Text('DashBoard', style: TextStyle(color: Colors.white, fontSize: 50)),
        ),
      ),
    );
  }
}