import 'package:flutter/material.dart';
import 'package:marketo/constants/colors.dart';
import 'package:marketo/screens/new_list.dart';

class CardAdd extends StatelessWidget {
  const CardAdd({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NewList())),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('New List', style: TextStyle(color: white, fontSize: 20)),
            
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Icon(Icons.add_circle_outline_rounded, color: white, size: 30)
          )
        ],
      ),

      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        primary: grey,
        minimumSize: Size(size.width, 80),
        elevation: 2
      ),
    );
  }
}