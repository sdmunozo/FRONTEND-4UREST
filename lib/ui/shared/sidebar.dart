import 'package:dasha/ui/shared/widgets/logo.dart';
import 'package:dasha/ui/shared/widgets/menu_item.dart';
import 'package:dasha/ui/shared/widgets/text_separator.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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

          MenuItem( text: 'Inicio', icon: Icons.dashboard_outlined, onPressed: (){}),
          MenuItem( text: 'Cartas/Menús', icon: Icons.layers_outlined, onPressed: (){}),
          MenuItem( text: 'Configuración', icon: Icons.settings_outlined, onPressed: (){}),

          SizedBox(height: 30,),
          TextSeparator( text: '4UREST' ),

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
