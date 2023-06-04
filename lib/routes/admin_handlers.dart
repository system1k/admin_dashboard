import 'package:fluro/fluro.dart';
import 'package:admin_dashboard/ui/views/views.dart';

class AdminHandlers {

  static Handler login = Handler(
    handlerFunc: (contex, params) {
      return const LoginView();
    }
  );

  static Handler register = Handler(
    handlerFunc: (contex, params) {
      return const RegisterView();
    }
  );

}