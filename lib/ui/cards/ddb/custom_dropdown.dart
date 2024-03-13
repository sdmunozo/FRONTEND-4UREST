/* EJEMPLO DE APLICACION:
          CustomDropdown(options: [
            OptionDdb(id: '1', text: 'Opción 1'),
            OptionDdb(id: '2', text: 'Opción 2'),
            OptionDdb(id: '3', text: 'Opción 3'),
          ]),

*/

import 'package:flutter/material.dart';
import 'option_ddb.dart';

class CustomDropdown extends StatefulWidget {
  final List<OptionDdb> options;

  const CustomDropdown({Key? key, required this.options}) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  GlobalKey actionKey = LabeledGlobalKey("CustomDropdownKey");
  OverlayEntry? _overlayEntry;
  bool isDropdownOpened = false;
  OptionDdb? selectedOption;

  @override
  void initState() {
    super.initState();
  }

  OverlayEntry _createOverlayEntry(BuildContext context) {
    RenderBox renderBox =
        actionKey.currentContext!.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height + 5.0,
        width: size.width,
        child: Material(
          elevation: 4.0,
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: widget.options.map((OptionDdb option) {
              return ListTile(
                title: Text(option.text),
                onTap: () {
                  setState(() {
                    selectedOption = option;
                    isDropdownOpened = false;
                    _overlayEntry?.remove();
                  });
                  print(
                      'Selected option: ${option.text} with ID: ${option.id}');
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  void _toggleDropdown(BuildContext context) {
    if (isDropdownOpened) {
      _overlayEntry?.remove();
      setState(() {
        isDropdownOpened = false;
      });
    } else {
      _overlayEntry = _createOverlayEntry(context);
      Overlay.of(context)!.insert(_overlayEntry!);
      setState(() {
        isDropdownOpened = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return GestureDetector(
        key: actionKey,
        onTap: () => _toggleDropdown(context),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.red.shade600,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  selectedOption?.text ?? "Select an Option",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Icon(Icons.arrow_drop_down, color: Colors.white),
            ],
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }
}

/*
  void _toggleDropdown() {
  if (isDropdownOpened) {
    _overlayEntry?.remove();
    setState(() {
      isDropdownOpened = false;
    });
  } else {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context)?.insert(_overlayEntry!);
      setState(() {
        isDropdownOpened = true;
      });
    });
  }
}*/

/*
  void _toggleDropdown() {
    if (isDropdownOpened) {
      _overlayEntry?.remove();
      setState(() {
        isDropdownOpened = false;
      });
    } else {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context)!.insert(_overlayEntry!);
      setState(() {
        isDropdownOpened = true;
      });
    }
  } */
