import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/providers/providers.dart';
import 'package:admin_dashboard/routes/routes.dart';
import 'package:admin_dashboard/services/services.dart';
import 'package:admin_dashboard/ui/shared/shared.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  void navigateTo(String routeName) {
    NavigationService.navigateTo(routeName);
    SideMenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {

    final sideMenuProvider = Provider.of<SideMenuProvider>(context);

    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [

          const Logo(),

          const SizedBox(height: 40),
          const TextSeparator(text: 'Main'),

          MenuItem(
            isActive: sideMenuProvider.currentPage == Flurorouter.dashboardRoute,
            text: 'Dashboard', 
            icon: Icons.compass_calibration_outlined, 
            onPressed: ()=> navigateTo(Flurorouter.dashboardRoute)
          ),
          
          MenuItem(text: 'Orders', icon: Icons.shopping_cart_outlined, onPressed: (){}),
          MenuItem(text: 'Analytics', icon: Icons.show_chart_outlined, onPressed: (){}),
          MenuItem(text: 'Categories', icon: Icons.layers_outlined, onPressed: (){}),
          MenuItem(text: 'Products', icon: Icons.dashboard_outlined, onPressed: (){}),
          MenuItem(text: 'Discount', icon: Icons.attach_money_outlined, onPressed: (){}),
          MenuItem(text: 'Costumers', icon: Icons.people_alt_outlined, onPressed: (){}),

          const SizedBox(height: 20),
          const TextSeparator(text: 'UI Elements'),

          MenuItem(
            isActive: sideMenuProvider.currentPage == Flurorouter.iconsRoute,
            text: 'Icons', 
            icon: Icons.list_alt_outlined, 
            onPressed: ()=> navigateTo(Flurorouter.iconsRoute)
          ),
          
          MenuItem(text: 'Marketing', icon: Icons.mark_email_read_outlined, onPressed: (){}),
          MenuItem(text: 'Campaign', icon: Icons.note_add_outlined, onPressed: (){}),
          
          MenuItem(
            isActive: sideMenuProvider.currentPage == Flurorouter.blankRoute,
            text: 'Blank', 
            icon: Icons.post_add_outlined, 
            onPressed: ()=> navigateTo(Flurorouter.blankRoute)
          ),

          const SizedBox(height: 35),
          const TextSeparator(text: 'Exit'),

          MenuItem(text: 'Logout', icon: Icons.exit_to_app_outlined, onPressed: (){})

        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color(0xff092044),
        Color(0xff092042)
      ]
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10
      )
    ]
  );

}