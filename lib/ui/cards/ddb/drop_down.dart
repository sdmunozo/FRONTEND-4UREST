import 'package:flutter/material.dart';
import 'arrow_clipper.dart'; // Asegúrate de que esta importación sea correcta
import 'drop_down_item.dart'; // Asegúrate de que esta importación sea correcta

class DropDown extends StatelessWidget {
  final double itemHeight;
  final List<String> options;
  final Function(String) onSelected;

  const DropDown({
    Key? key,
    required this.itemHeight,
    required this.options,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 5),
        Align(
          alignment: Alignment(-0.85, 0),
          child: ClipPath(
            clipper: ArrowClipper(),
            child: Container(
              height: 20,
              width: 30,
              decoration: BoxDecoration(color: Colors.red.shade600),
            ),
          ),
        ),
        Material(
          elevation: 20,
          shape: ArrowShape(),
          child: Container(
            height: options.length * itemHeight + 40,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: ListView.builder(
              itemCount: options.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => onSelected(options[index]),
                child: DropDownItem(
                  text: options[index],
                  iconData: Icons
                      .circle, // Puedes cambiar este icono por cualquier otro
                  isSelected: false,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
