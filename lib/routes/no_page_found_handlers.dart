import 'package:fluro/fluro.dart';
import 'package:admin_dashboard/ui/views/views.dart';

class NoPageFoundHandlers {

  static Handler noPageFound = Handler(
    handlerFunc: (contex, params) {
      return const NoPageFoundView();
    }
  );

}