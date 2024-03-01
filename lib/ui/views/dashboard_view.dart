import 'package:dasha/providers/auth_provider.dart';
import 'package:flutter/material.dart';

import 'package:dasha/ui/labels/custom_labels.dart';
import 'package:dasha/ui/cards/white_card.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final user  = Provider.of<AuthProvider>(context).user!;
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('Dashboard View', style: CustomLabels.h1 ),

          SizedBox( height: 10 ),

          WhiteCard(
            title: user.userFirstName,
            child: Text(user.userEmail)
          )

        ],
      ),
    );
  }
}