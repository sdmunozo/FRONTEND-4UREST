import 'package:dasha/ui/cards/dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDownList extends StatefulWidget {
  final String? title;
  final List<DropdownItem> items; // La lista de elementos
  final String? selectedItemValue; // El valor del elemento seleccionado
  final double? width;
  final Function(String?)
      onSelected; // Callback para manejar cambios de selección

  const DropDownList({
    Key? key,
    required this.items,
    this.selectedItemValue,
    this.title,
    this.width,
    required this.onSelected,
  }) : super(key: key);

  @override
  _DropDownListState createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  String? dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.selectedItemValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width != null ? widget.width : null,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(10),
      decoration: buildBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null) ...[
            FittedBox(
              fit: BoxFit.contain,
              child: Text(
                widget.title!,
                style: GoogleFonts.roboto(
                    fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Divider()
          ],
          DropdownButton<String>(
            isExpanded: true,
            value: dropdownValue,
            onChanged: (newValue) {
              setState(() {
                dropdownValue = newValue;
              });
              widget.onSelected(newValue);
            },
            items:
                widget.items.map<DropdownMenuItem<String>>((DropdownItem item) {
              return DropdownMenuItem<String>(
                value: item.value,
                child: Text(item.name),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5)
        ],
      );
}
