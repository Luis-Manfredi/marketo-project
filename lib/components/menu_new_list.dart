import 'package:flutter/material.dart';

class MenuItem {
  final String text;
  final Icon icon;

  const MenuItem({required this.icon, required this.text});
}

class MenuItemList{

  static const List<MenuItem> itemOptions = [
    changeName,
    saveList,
    clearList
  ];

  static const List<MenuItem> closeOption = [
    close
  ];

  static const changeName = MenuItem(
    text: 'Set List Name',
    icon: Icon(Icons.settings_rounded, color: Color(0xff284b63))
  );

  static const saveList = MenuItem(
    text: 'Save List',
    icon: Icon(Icons.save_rounded, color: Color(0xff284b63))
  );

  static const clearList = MenuItem(
    text: 'Clear List',
    icon: Icon(Icons.clear_all_rounded, color: Color(0xff284b63))
  );

  static const close = MenuItem(
    text: 'Close',
    icon: Icon(Icons.clear_rounded, color: Color(0xff284b63))
  );
}