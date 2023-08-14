// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:admin_dashboard/ui/layout/SplashLayout/splash_layout.dart';
import 'package:admin_dashboard/ui/layout/dashboard/dashboard_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/providers/auth_provider.dart';

import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_services.dart';

import 'package:admin_dashboard/ui/layout/auth/auth_layout.dart';

void main() async {
  await LocalStorage.configurePrefs();
  Fluroroure.configureRoutes();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            lazy: false, //esto es para que pase el proceso de ver el jwt
            create: (_) => AuthProvider())
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: '/',
        onGenerateRoute: Fluroroure.router.generator,
        navigatorKey: NavigationServices.navigatorKey,
        builder: (_, child) {

          final authProvider = Provider.of<AuthProvider>(context);

          if (authProvider.authStatus == AuthStatus.checking)
            return const SplashLayout();
            

          if (authProvider.authStatus == AuthStatus.authenticated) {
            return DashboardLayout(child: child!);
          } else {
            return AuthLayout(child: child!);
          }

        },
        theme: ThemeData.light().copyWith(
          scrollbarTheme: const ScrollbarThemeData().copyWith(
            thumbColor: MaterialStateProperty.all(
              Colors.grey.withOpacity(0.5),
            ),
          ),
        ));
  }
}
