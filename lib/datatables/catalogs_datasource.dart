import 'dart:js';

import 'package:dasha/providers/catalogs_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dasha/models/catalog.dart';
import 'package:provider/provider.dart';

class CatalogsDTS extends DataTableSource {
  List<Catalog> catalogs = [];

  CatalogsDTS(this.catalogs);

  @override
  DataRow getRow(int index) {
    final catalog = catalogs[index];

    Widget iconWidget = catalog.icon != null
        ? Image.network(catalog.icon!)
        : Icon(Icons.image);

    String isActiveText = catalog.isActive ? 'Activado' : 'Desactivado';
    String isScheduleActiveText = catalog.isScheduleActive ? 'Activado' : 'Desactivado';

    return DataRow.byIndex(index: index, cells: [
      DataCell(iconWidget),
      DataCell(Text(catalog.name)),
      DataCell(Text(catalog.description)),
      DataCell(Text(isActiveText)),
      DataCell(Text(isScheduleActiveText)),
      DataCell(
        Row(children: [
          IconButton(
            onPressed: (){
              print("Editando: ${catalog.name}");
            }, 
            icon: Icon(Icons.edit_outlined)),
          IconButton(
            onPressed: (){
              final dialog = AlertDialog(
                    title: Text('¿Está seguro de borrarlo?'),
                    content: Text('¿Borrar definitivamente ${ catalog.name }?'),
                    actions: [
                      TextButton(
                        child: Text('No'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('Si, borrar'),
                        onPressed: () async {
                          await Provider.of<CatalogsProvider>(context, listen: false)
                            .deleteCategory(categoria.id);

                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );

                  showDialog(
                    context: context, 
                    builder: ( _ ) => dialog 
                  );
            }, 
            icon: Icon(Icons.delete_outline, color: Colors.red.withOpacity(0.8),)),
        ],)
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => catalogs.length;

  @override
  int get selectedRowCount => 0;
}
