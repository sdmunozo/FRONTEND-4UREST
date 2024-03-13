import 'package:dasha/models/http/auth_response.dart';
import 'package:flutter/material.dart';

class DropDownSample extends StatefulWidget {
  DropDownSample({super.key});

  @override
  State<DropDownSample> createState() => _DropDownSampleState();
}

class _DropDownSampleState extends State<DropDownSample> {
  String? selectedBrandId;

  void setSelectedBrandId(String? id) {
    selectedBrandId = id!;
  }

  @override
  Widget build(newContext) {
    List<DropdownMenuItem<String>> brandItems = [];

    /*brands?.map((brand) {
      return DropdownMenuItem<String>(
        value: brand.id,
        child: Text(brand.name, style: TextStyle(color: Colors.white)),
      );
    }).toList() ??
        [];*/

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: DropdownButton<String>(
        dropdownColor: Color(0xff092044),
        value: selectedBrandId,
        items: brandItems,
        onChanged: (value) {
          if (value != null) {
            setSelectedBrandId(value);
            setState(() {
              selectedBrandId = value;
            });
            print(value);
          }
        },
        isExpanded: true,
        hint:
            Text("Seleccione una marca", style: TextStyle(color: Colors.white)),
        icon: Icon(Icons.arrow_drop_down, color: Colors.white),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
