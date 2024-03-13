import 'package:dasha/providers/sidemenu_provider.dart';
import 'package:dasha/ui/cards/ddb/custom_dropdown.dart';
import 'package:dasha/ui/cards/ddb/option_ddb.dart';
import 'package:dasha/ui/labels/custom_labels.dart';
import 'package:dasha/ui/shared/widgets/dropdown_sample.dart';
import 'package:flutter/material.dart';
import 'package:dasha/ui/shared/widgets/navbar_avatar.dart';
import 'package:dasha/ui/shared/widgets/notifications_indicator.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: 50,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [
          if (size.width <= 700)
            IconButton(
                icon: Icon(Icons.menu_outlined),
                onPressed: () => SideMenuProvider.openMenu()),
          SizedBox(width: 10),
          Text("Fruteria La Unica", style: CustomLabels.h1),
          Text(" - ", style: CustomLabels.h1),
          Text("Rio", style: CustomLabels.h1),
          Spacer(),
          NotificationsIndicator(),
          SizedBox(width: 10),
          NavbarAvatar(),
          SizedBox(width: 10)
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
      color: Colors.white,
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]);
}

/*

      import 'package:dasha/ui/shared/widgets/search_text.dart';
          // Search input
          if ( size.width > 390 ) 
            ConstrainedBox(
              constraints: BoxConstraints( maxWidth: 250 ),
              child: SearchText(),
            ),
        

*/
