import 'package:fluro/fluro.dart';
import 'package:admin_dashboard/routes/routes_barrel.dart';

class Flurorouter {

  static final FluroRouter router = FluroRouter(); 

  static String rootRoute = '/';

  // Auth routes
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  // Dashboard route
  static String dashboard = '/dashboard';

  static void configureRoutes(){
    // Auth routes
    router.define(rootRoute, handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute, handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute, handler: AdminHandlers.register, transitionType: TransitionType.none);

    // 404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }

}