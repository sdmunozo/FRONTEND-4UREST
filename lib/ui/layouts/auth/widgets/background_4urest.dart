import 'package:flutter/material.dart';

class Background4urest extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
    decoration: buildBoxDecoration(),
    child: Container(
      constraints: BoxConstraints(maxWidth: 400),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Image(
            image: AssetImage("4uRestIcon-white.png"),
            width: 600,
          ),
        )),),
    
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
        image: DecorationImage(
          image: AssetImage('restaurant-bg.jpg'),
          fit: BoxFit.cover
        )
    );
  }
}