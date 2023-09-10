import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/ui/views/views.dart';
import 'package:admin_dashboard/providers/providers.dart';

class DashboardHandlers {

  static Handler dashboard = Handler(
    handlerFunc: (context, params) {

      final authProvider = Provider.of<AuthProvider>(context!);

      if(authProvider.authStatus == AuthStatus.authenticated) {
        return const DashboardView();
      } else {
        return const LoginView();
      } 
      
    }
  );

}