import 'dart:html';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return const ClipOval(      
      child: _MyImage(),
    );
  }

}

class _MyImage extends StatelessWidget {
  const _MyImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String imageUrl = 'https://archive.smashing.media/assets/344dbf88-fdf9-42bb-adb4-46f01eedd629/4af3e5d8-3352-49bd-9570-de2aef8972b9/eric-bailey-profile.jpg';
    
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      imageUrl,
      (int _) => ImageElement()..src = imageUrl,
    );

    return SizedBox(
      width: 30,
      height: 30,
      child: HtmlElementView(
        viewType: imageUrl,
      ),
    );

  }
}