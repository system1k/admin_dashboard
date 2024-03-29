import 'package:fluro/fluro.dart';
import 'package:admin_dashboard/routes/routes_barrel.dart';

class Flurorouter {

  static final FluroRouter router = FluroRouter(); 

  static String rootRoute = '/';

  // Auth routes
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  // Dashboard route
  static String dashboardRoute = '/dashboard';
  static String iconsRoute = '/dashboard/icons';
  static String blankRoute = '/dashboard/blank';

  static void configureRoutes(){
    // Auth routes
    router.define(rootRoute, handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute, handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute, handler: AdminHandlers.register, transitionType: TransitionType.none);

    // Dashboard routes
    router.define(dashboardRoute, handler: DashboardHandlers.dashboard, transitionType: TransitionType.fadeIn);
    router.define(iconsRoute, handler: DashboardHandlers.icons, transitionType: TransitionType.fadeIn);
    router.define(blankRoute, handler: DashboardHandlers.blank, transitionType: TransitionType.fadeIn);

    // 404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }

}