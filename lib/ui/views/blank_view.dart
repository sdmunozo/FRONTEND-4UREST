import 'package:flutter/material.dart';

import 'package:dasha/ui/labels/custom_labels.dart';
import 'package:dasha/ui/cards/white_card.dart';

class BlankView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('Blank View', style: CustomLabels.h1),
          SizedBox(height: 10),
          WhiteCard(title: 'Blank Page', child: Text('Hola Mundo!!'))
        ],
      ),
    );
  }
}
