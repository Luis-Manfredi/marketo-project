import 'package:flutter/material.dart';
import 'package:marketo/constants/colors.dart';

class CustomCloseButton extends StatefulWidget {
  const CustomCloseButton({ Key? key }) : super(key: key);

  @override
  State<CustomCloseButton> createState() => _CustomCloseButtonState();
}

class _CustomCloseButtonState extends State<CustomCloseButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.pop(context),
      child: Icon(Icons.close, color: blue, size: 24),
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        onPrimary: Colors.transparent,
        shadowColor: Colors.transparent,
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap
      ),      
    );
  }
}