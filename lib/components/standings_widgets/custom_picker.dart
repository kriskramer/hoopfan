import 'package:flutter/material.dart';

Container customPicker(BuildContext context, List items, Color colour,
    String chosenValue, Function(dynamic) changeFunct,
    {Color dropDownColor = const Color(0XFF1F6BA3),
    Color textColour = Colors.white}) {
  List<DropdownMenuItem> itemList = [];
  for (var item in items) {
    var option = DropdownMenuItem(
      child: Text(
        "$item",
        style: TextStyle(
          color: textColour,
        ),
      ),
      value: item,
    );
    itemList.add(option);
  }

  return Container(
    color: colour,
    child: DropdownButton(
      dropdownColor: dropDownColor,
      iconEnabledColor: Colors.white,
      underline: Container(),
      items: itemList,
      value: chosenValue,
      onChanged: changeFunct,
    ),
  );
}
