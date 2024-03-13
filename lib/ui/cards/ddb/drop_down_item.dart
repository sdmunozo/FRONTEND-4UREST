import 'package:flutter/material.dart';

class DropDownItem extends StatelessWidget {
  final String text;
  final IconData iconData;
  final bool isSelected;
  final bool isFirstItem;
  final bool isLastItem;

  const DropDownItem({
    Key? key,
    required this.text,
    required this.iconData,
    this.isSelected = false,
    this.isFirstItem = false,
    this.isLastItem = false,
  }) : super(key: key);

  factory DropDownItem.first(
      {required String text,
      required IconData iconData,
      bool isSelected = false}) {
    return DropDownItem(
      text: text,
      iconData: iconData,
      isSelected: isSelected,
      isFirstItem: true,
    );
  }

  factory DropDownItem.last(
      {required String text,
      required IconData iconData,
      bool isSelected = false}) {
    return DropDownItem(
      text: text,
      iconData: iconData,
      isSelected: isSelected,
      isLastItem: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: isFirstItem ? Radius.circular(8) : Radius.zero,
          bottom: isLastItem ? Radius.circular(8) : Radius.zero,
        ),
        color: isSelected ? Colors.red.shade900 : Colors.red.shade600,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: <Widget>[
          Icon(
            iconData,
            color: Colors.white,
          ),
          SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
