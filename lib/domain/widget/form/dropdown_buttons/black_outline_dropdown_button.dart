import 'package:flutter/material.dart';
import 'base_dropdow_button.dart';

class BlackOutlineDropdownButton extends BaseDropdownButton {
  final Function(dynamic value) onChanged;
  final List<DropdownMenuItem> items;
  final String hint;
  final bool isSmall;
  final dynamic value;
  final Color changeColor;

  BlackOutlineDropdownButton( 
      {@required this.onChanged, @required this.items,this.value,this.changeColor, @required this.hint,this.isSmall = false,})
      : super(
          hintColor: changeColor??Colors.black,
          color: Colors.transparent,
          onChanged: onChanged,
          borderColor: changeColor??Colors.black,
          items: items,
          hint: hint,
          value:value,
          padding: isSmall ? EdgeInsets.symmetric(horizontal: 16, vertical: 6) : null
        );
}
