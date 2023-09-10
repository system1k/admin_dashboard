import 'package:fluro/fluro.dart';
import 'package:admin_dashboard/ui/views/views.dart';

class NoPageFoundHandlers {

  static Handler noPageFound = Handler(
    handlerFunc: (context, params) {
      return const NoPageFoundView();
    }
  );

}