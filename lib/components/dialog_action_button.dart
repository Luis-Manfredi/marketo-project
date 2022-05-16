import 'package:flutter/material.dart';
import 'package:marketo/constants/colors.dart';

class DialogActionButton extends StatelessWidget {
  const DialogActionButton({ Key? key, 
    required this.function, 
    required this.text, 
    required this.backgroundColor 
  }) : super(key: key);

  final VoidCallback function;
  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: 125,
      child: ElevatedButton(
        onPressed: function,
        child: Text(text, style: TextStyle(color: white, fontSize: 18)),
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          minimumSize: Size(size.width, 50),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))
          )
        ),
      ),
    );
  }
}