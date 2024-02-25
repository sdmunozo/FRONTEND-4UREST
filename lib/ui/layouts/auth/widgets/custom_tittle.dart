import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('4uRestFont-white.png',
          width: 350,),
          //height: 350,)
          ]),
    );
  }
}