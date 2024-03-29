import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/cards/cards.dart';
import 'package:admin_dashboard/ui/labels/labels.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [

        Text('Dashboard View', style: CustomLebels.h1),

        const SizedBox(height: 10),

        const WhiteCard(
          title: 'Sales statistics',
          child: Text('Hola Mundo'),
        )

      ],
    );
  }
}