import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/layout/auth/auth_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  Fluroroure.configureRoutes();
  runApp(const AppState());
  }
class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => AuthProvider())
    ],
    child: const MyApp(),
    );
  }
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