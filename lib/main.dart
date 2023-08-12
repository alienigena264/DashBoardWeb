import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/layout/auth/auth_layout.dart';
import 'package:flutter/material.dart';

void main() {
  Fluroroure.configureRoutes();
  runApp(const MyApp());
  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/',
      onGenerateRoute: Fluroroure.router.generator,
      builder: (_, child) {
        return  AuthLayout(child: child!);
      },
      theme: ThemeData.light().copyWith(
        scrollbarTheme: const ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(
            Colors.grey.withOpacity(0.5),
          ),
        ),
      )
    );
  }
}