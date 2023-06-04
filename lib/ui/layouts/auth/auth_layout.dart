import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/widgets.dart';

class AuthLayout extends StatelessWidget {

  final Widget child;

  const AuthLayout({
    Key? key, 
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Scrollbar(
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
      
            (size.width > 1000)
              ? _DesktopBody(child: child)
              : _MobileBody(child: child),
      
            const LinksBar()
      
          ],
        ),
      )
    );
  }
}

class _DesktopBody extends StatelessWidget {

  final Widget child;

  const _DesktopBody({
    Key? key, 
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height * 0.95,
      child: Row(
        children: [

          const AuthBackground(),

          Container(
            width: 600,
            height: double.infinity,
            color: Colors.black,
            child: Column(
              children: [

                const SizedBox(height: 20),
                const CustomTittle(),
                const SizedBox(height: 50),

                Expanded(child: child)

              ],
            )
          )

        ],
      )
    );
  }
  
}

class _MobileBody extends StatelessWidget {
  
  final Widget child;
  
  const _MobileBody({
    Key? key, 
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          const SizedBox(height: 20),
          const CustomTittle(),

          SizedBox(
            width: double.infinity,
            height: 420,
            child: child
          ),

          const SizedBox(
            width: double.infinity,
            height: 400,
            child: AuthBackground()
          )

        ],
      )
    );
  }
}