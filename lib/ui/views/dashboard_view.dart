import 'package:dasha/providers/auth_provider.dart';
import 'package:dasha/ui/cards/ddb/custom_dropdown.dart';
import 'package:dasha/ui/cards/ddb/custom_option_list.dart';
import 'package:dasha/ui/cards/ddb/drop_down_item.dart';
import 'package:dasha/ui/cards/ddb/option_ddb.dart';
import 'package:dasha/ui/shared/widgets/dropdown_sample.dart';
import 'package:flutter/material.dart';

import 'package:dasha/ui/labels/custom_labels.dart';
import 'package:dasha/ui/cards/white_card.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context).user!;

    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('Dashboard View', style: CustomLabels.h1),
          SizedBox(height: 10),
          CustomDropdown(options: [
            OptionDdb(id: '1', text: 'Opción 1'),
            OptionDdb(id: '2', text: 'Opción 2'),
            OptionDdb(id: '3', text: 'Opción 3'),
          ]),
          SizedBox(height: 10),
          WhiteCard(title: user.userFirstName, child: Text(user.userEmail)),
        ],
      ),
    );
  }
}
