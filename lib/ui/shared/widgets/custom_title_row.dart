import 'package:dasha/ui/shared/widgets/text_separator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitleRow extends StatelessWidget {
  final String title;
  final String text;
  final IconData icon;
  final String id;

  const CustomTitleRow({
    Key? key,
    required this.title,
    required this.text,
    required this.icon,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextSeparator(text: title),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Icon(icon, color: Colors.white),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  text,
                  style: GoogleFonts.roboto(
                      fontSize: 16, color: Colors.white.withOpacity(0.8)),
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
      ],
    );
  }
}
