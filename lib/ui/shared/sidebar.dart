import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dasha/providers/sidemenu_provider.dart';

import 'package:dasha/router/router.dart';

import 'package:dasha/services/navigation_service.dart';

import 'package:dasha/ui/shared/widgets/menu_item.dart';
import 'package:dasha/ui/shared/widgets/logo.dart';
import 'package:dasha/ui/shared/widgets/text_separator.dart';

class Sidebar extends StatelessWidget {

  void navigateTo( String routeName ) {
    NavigationService.navigateTo( routeName );
    SideMenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {

    final sideMenuProvider = Provider.of<SideMenuProvider>(context);

    return Container(
      width: 256,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Logo(),
          SizedBox(height: 50,),
          TextSeparator( text: 'ADMIN DASHBOARD' ),

          MenuItem( 
            text: 'Inicio', 
            icon: Icons.dashboard_outlined, 
            onPressed: () => navigateTo( Flurorouter.dashboardRoute ),
            isActive: sideMenuProvider.currentPage == Flurorouter.dashboardRoute,
          ),


          MenuItem( text: 'Cartas/Menús', icon: Icons.layers_outlined, onPressed: (){}),
          MenuItem( text: 'Configuración', icon: Icons.settings_outlined, onPressed: (){}),
          
          MenuItem( 
            text: 'Icons', 
            icon: Icons.list_alt_outlined, 
            onPressed: () => navigateTo( Flurorouter.iconsRoute ),
            isActive: sideMenuProvider.currentPage == Flurorouter.iconsRoute,
          ),

          SizedBox(height: 50,),
          TextSeparator( text: 'Salir' ),

          MenuItem( text: 'Cerrar sesión', icon: Icons.exit_to_app_outlined, onPressed: (){}),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color( 0xff092044 ),
        Color( 0xff092042 ),
      ]
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10
      )
    ]
  );
}
