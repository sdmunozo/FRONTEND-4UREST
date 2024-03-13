import 'package:flutter/material.dart';
import 'package:dasha/ui/labels/custom_labels.dart';
import 'package:dasha/ui/cards/white_card.dart';

// Asume que ya tienes definida la clase DropDownItem y DropDownList aquí

class IconsView extends StatefulWidget {
  @override
  _IconsViewState createState() => _IconsViewState();
}

class _IconsViewState extends State<IconsView> {
  List<String> marcas = ['Marca 1', 'Marca 2', 'Marca 3'];
  List<String> sucursales = ['Sucursal 1', 'Sucursal 2', 'Sucursal 3'];
  String? marcaSeleccionada;
  String? sucursalSeleccionada;

  @override
  void initState() {
    super.initState();
    marcaSeleccionada = marcas.first;
    sucursalSeleccionada = sucursales.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('Icons', style: CustomLabels.h1),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment
                .spaceEvenly, // Centra los dropdowns horizontalmente
            children: [],
          ),
          SizedBox(height: 10),
          WhiteCard(
              title: 'ac_unit_outlined',
              child: Center(child: Icon(Icons.ac_unit_outlined)),
              width: 170),
          WhiteCard(
              title: 'access_alarms_outlined',
              child: Center(child: Icon(Icons.access_alarms_outlined)),
              width: 170),
          WhiteCard(
              title: 'access_time_rounded',
              child: Center(child: Icon(Icons.access_time_rounded)),
              width: 170),
          WhiteCard(
              title: 'all_inbox_outlined',
              child: Center(child: Icon(Icons.all_inbox_outlined)),
              width: 170),
          WhiteCard(
              title: 'desktop_mac_sharp',
              child: Center(child: Icon(Icons.desktop_mac_sharp)),
              width: 170),
          WhiteCard(
              title: 'keyboard_tab_rounded',
              child: Center(child: Icon(Icons.keyboard_tab_rounded)),
              width: 170),
          WhiteCard(
              title: 'not_listed_location',
              child: Center(child: Icon(Icons.not_listed_location)),
              width: 170),
        ],
      ),
    );
  }
}

/*import 'package:flutter/material.dart';
import 'package:dasha/ui/labels/custom_labels.dart';
import 'package:dasha/ui/cards/white_card.dart';

class IconsView extends StatefulWidget {
  @override
  _IconsViewState createState() => _IconsViewState();
}

class _IconsViewState extends State<IconsView> {
  List<String> marcas = ['Marca 1', 'Marca 2', 'Marca 3'];
  List<String> sucursales = ['Sucursal 1', 'Sucursal 2', 'Sucursal 3'];
  String? marcaSeleccionada;
  String? sucursalSeleccionada;

  @override
  void initState() {
    super.initState();
    marcaSeleccionada = marcas.first;
    sucursalSeleccionada = sucursales.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('Icons', style: CustomLabels.h1),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Centra los dropdowns horizontalmente
            children: [
              // DropDownList de marcas aqui
              // DropDownList de sucursales aqui
            ],
          ),
          SizedBox(height: 10),
          Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: [
                WhiteCard(
                title: 'ac_unit_outlined',
                child: Center( child: Icon( Icons.ac_unit_outlined) ),
                width: 170
              ),
            ]
          ),
          SizedBox(height: 10),

          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: [
                WhiteCard(
                title: 'ac_unit_outlined',
                child: Center( child: Icon( Icons.ac_unit_outlined) ),
                width: 170
              ),

              WhiteCard(
                title: 'access_alarms_outlined',
                child: Center( child: Icon( Icons.access_alarms_outlined) ),
                width: 170
              ),

              WhiteCard(
                title: 'access_time_rounded',
                child: Center( child: Icon( Icons.access_time_rounded) ),
                width: 170
              ),

              WhiteCard(
                title: 'all_inbox_outlined',
                child: Center( child: Icon( Icons.all_inbox_outlined) ),
                width: 170
              ),

              WhiteCard(
                title: 'desktop_mac_sharp',
                child: Center( child: Icon( Icons.desktop_mac_sharp) ),
                width: 170
              ),

              WhiteCard(
                title: 'keyboard_tab_rounded',
                child: Center( child: Icon( Icons.keyboard_tab_rounded) ),
                width: 170
              ),

              WhiteCard(
                title: 'not_listed_location',
                child: Center( child: Icon( Icons.not_listed_location) ),
                width: 170
              ),
            ],
          )
        ],
      ),
    );
  }
}
*/

/*import 'package:flutter/material.dart';

import 'package:dasha/ui/labels/custom_labels.dart';
import 'package:dasha/ui/cards/white_card.dart';

class IconsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('Icons', style: CustomLabels.h1 ),

          SizedBox( height: 10 ),

          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: [

              WhiteCard(
                title: 'ac_unit_outlined',
                child: Center( child: Icon( Icons.ac_unit_outlined) ),
                width: 170
              ),

              WhiteCard(
                title: 'access_alarms_outlined',
                child: Center( child: Icon( Icons.access_alarms_outlined) ),
                width: 170
              ),

              WhiteCard(
                title: 'access_time_rounded',
                child: Center( child: Icon( Icons.access_time_rounded) ),
                width: 170
              ),

              WhiteCard(
                title: 'all_inbox_outlined',
                child: Center( child: Icon( Icons.all_inbox_outlined) ),
                width: 170
              ),

              WhiteCard(
                title: 'desktop_mac_sharp',
                child: Center( child: Icon( Icons.desktop_mac_sharp) ),
                width: 170
              ),

              WhiteCard(
                title: 'keyboard_tab_rounded',
                child: Center( child: Icon( Icons.keyboard_tab_rounded) ),
                width: 170
              ),

              WhiteCard(
                title: 'not_listed_location',
                child: Center( child: Icon( Icons.not_listed_location) ),
                width: 170
              ),

            ],
          )


        ],
      ),
    );
  }
}

*/
