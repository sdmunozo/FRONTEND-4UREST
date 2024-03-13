import 'dart:html';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class NavbarAvatar extends StatelessWidget {
  final String imageUrl =
      'https://png.pngtree.com/png-vector/20220609/ourmid/pngtree-person-gray-photo-placeholder-man-in-t-shirt-on-gray-background-png-image_4834298.png';

  NavbarAvatar() {
    // Registra la vista de la imagen.
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      imageUrl,
      (int _) => ImageElement()..src = imageUrl,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: 30,
        height: 30,
        child: HtmlElementView(
          viewType: imageUrl,
        ),
      ),
    );
  }
}
