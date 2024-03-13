import 'package:dasha/ui/cards/ddb/option_ddb.dart';
import 'package:flutter/material.dart';

class CustomOptionList extends StatelessWidget {
  final List<OptionDdb> options = [
    OptionDdb(id: '1', text: 'Opción 1'),
    OptionDdb(id: '2', text: 'Opción 2'),
    OptionDdb(id: '3', text: 'Opción 3'),
    // Agrega más opciones si lo deseas
  ];

  void _onOptionSelected(OptionDdb option) {
    print('Texto: ${option.text}, ID: ${option.id}');
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap:
          true, // Importante para que no intente ocupar todo el espacio disponible
      physics:
          NeverScrollableScrollPhysics(), // Evita el scrolling dentro de este ListView
      itemCount: options.length,
      itemBuilder: (context, index) {
        final option = options[index];
        return ListTile(
          title: Text(option.text, style: TextStyle(color: Colors.black)),
          onTap: () => _onOptionSelected(option),
        );
      },
    );
  }
}
