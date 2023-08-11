
import 'package:admin_dashboard/ui/view/no_page_found.dart';
import 'package:fluro/fluro.dart';

class NoPageFoundHandler {

  static Handler noPageFound = Handler(
    handlerFunc: ( context, params ) {
      return const  NoPageFound();
    }
  );

  
}