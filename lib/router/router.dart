import 'package:admin_dashboard/router/admin_handlres.dart';
import 'package:admin_dashboard/router/no_page_found_handler.dart';
import 'package:fluro/fluro.dart';
class Fluroroure {
  static final FluroRouter router = FluroRouter();


  static String rootRoute = '/';
  //auth Router

  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';


  //dashboard Router
  static String dashboardRoute = '/dashboard';

  static void configureRoutes() {
    //Auth routes
    router.define(rootRoute, handler: AdminHandlers.login);
    router.define(loginRoute, handler: AdminHandlers.login);
    // router.define(registerRoute, handler: null);

    //Dashboard routes
    // router.define(dashboardRoute, handler: null);

    //404
    router.notFoundHandler = NoPageFoundHandler.noPageFound;
  }
  //Auth routes
}