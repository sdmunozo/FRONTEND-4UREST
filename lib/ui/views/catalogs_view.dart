import 'package:dasha/datatables/catalogs_datasource.dart';
import 'package:dasha/providers/auth_provider.dart';
import 'package:dasha/providers/catalogs_provider.dart';
import 'package:dasha/ui/buttons/custom_icon_button.dart';
import 'package:flutter/material.dart';

import 'package:dasha/ui/labels/custom_labels.dart';
import 'package:provider/provider.dart';

class CatalogsView extends StatefulWidget {
  @override
  State<CatalogsView> createState() => _CatalogsViewState();
}

class _CatalogsViewState extends State<CatalogsView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  

@override
void initState() {
  super.initState();
  Provider.of<CatalogsProvider>(context, listen: false).getCatalogs();
}


  @override
  Widget build(BuildContext context) {
      
      final catalogs = Provider.of<CatalogsProvider>(context).catalogs;

    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('Cartas / Menús', style: CustomLabels.h1),
          SizedBox(height: 10),
          PaginatedDataTable(
            columns: [
              DataColumn(label: Text('Imagen')),
              DataColumn(label: Text('Catalogo')),
              DataColumn(label: Text('Descripción')),
              DataColumn(label: Text('Estado')),
              DataColumn(label: Text('Horario')),
              DataColumn(label: Text('Acciones')),
            ],
            source: CatalogsDTS(catalogs),
            header: Text(
              'Cartas / Menús disponibles',
              maxLines: 2,
            ),
            onRowsPerPageChanged: (value) => {
              setState(() {
                _rowsPerPage = value ?? 10;
              })
            },
            rowsPerPage: _rowsPerPage,
            actions: [
              CustomIconButton(
                onPressed: () {},
                text: 'Crear',
                icon: Icons.add_outlined,
              )
            ],
          )
        ],
      ),
    );
  }
}
