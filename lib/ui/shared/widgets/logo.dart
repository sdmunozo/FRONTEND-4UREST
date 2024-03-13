import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            '4uRestIcon-white.png',
            width: 50,
          ),
          SizedBox(width: 10),
          Text(
            'Dasha',
            style: GoogleFonts.montserratAlternates(
                fontSize: 30, fontWeight: FontWeight.w200, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
