import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/ui/views/views.dart';
import 'package:admin_dashboard/providers/providers.dart';

class AdminHandlers {

  static Handler login = Handler(
    handlerFunc: (context, params) {

      final authProvider = Provider.of<AuthProvider>(context!);

      if(authProvider.authStatus == AuthStatus.notAuthenticated) {
        return const LoginView();
      } else {
        return const DashboardView();
      }    
      
    }
  );

  static Handler register = Handler(
    handlerFunc: (context, params) {

      final authProvider = Provider.of<AuthProvider>(context!);

      if(authProvider.authStatus == AuthStatus.notAuthenticated) {
        return const RegisterView();
      } else {
        return const DashboardView();
      }
      
    }
  );

}