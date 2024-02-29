import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('4uRestFont-white.png',
          width: 350,),
          //height: 350,)

          FittedBox(
            fit: BoxFit.contain,
            child: Text(
              'Para Restaurantes',
              style: GoogleFonts.montserratAlternates(
                fontSize: 50,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
          )
          
          ]),
    );
  }
}