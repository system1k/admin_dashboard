import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/cards/cards.dart';
import 'package:admin_dashboard/ui/labels/labels.dart';

class IconsView extends StatelessWidget {
  const IconsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [

        Text('Icons', style: CustomLebels.h1),

        const SizedBox(height: 10),

        Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          direction: Axis.horizontal,
          children: const [

            WhiteCard(
              title: 'ac_unit_outlined',
              width: 170,
              child: Icon(Icons.ac_unit_outlined)
            ),

             WhiteCard(
              title: 'back_hand_outlined',
              width: 170,
              child: Icon(Icons.back_hand_outlined)
            ),

             WhiteCard(
              title: 'cabin_outlined',
              width: 170,
              child: Icon(Icons.cabin_outlined)
            ),

             WhiteCard(
              title: 'dangerous_outlined',
              width: 170,
              child: Icon(Icons.dangerous_outlined)
            ),

             WhiteCard(
              title: 'eco_outlined',
              width: 170,
              child: Icon(Icons.eco_outlined)
            ),

             WhiteCard(
              title: 'face_2_outlined',
              width: 170,
              child: Icon(Icons.face_2_outlined)
            ),

             WhiteCard(
              title: 'gamepad_outlined',
              width: 170,
              child: Icon(Icons.gamepad_outlined)
            ),

             WhiteCard(
              title: 'hail_outlined',
              width: 170,
              child: Icon(Icons.hail_outlined)
            )

          ],
        )
        
      ],
    );
  }
}