import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/services/services.dart';
import 'package:admin_dashboard/routes/routes.dart';
import 'package:admin_dashboard/providers/providers.dart';
import 'package:admin_dashboard/ui/layouts/layouts.dart';

void main() async {

  await LocalStorage.configurePrefs();
  Flurorouter.configureRoutes();
  runApp(const AppState());

}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => AuthProvider()
        )
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
      title: 'Admin Dashboard',
      initialRoute: Flurorouter.rootRoute,
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationService.navigatorKey,
      builder: (_, child) {

        final authPorvider = Provider.of<AuthProvider>(context);

        if(authPorvider.authStatus == AuthStatus.checking) {
          return const SplashLayout();
        }

        if(authPorvider.authStatus == AuthStatus.authenticated) {
          return DashboardLayout(child: child!);
        } else {
          return AuthLayout(child: child!);
        }

      },
      theme: ThemeData.light().copyWith(
        scrollbarTheme: const ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.5))
        )
      )
    );
  }
}