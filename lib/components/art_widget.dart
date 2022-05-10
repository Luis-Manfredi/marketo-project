import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketo/constants/colors.dart';

class ArtWidget extends StatelessWidget {
  const ArtWidget({ Key? key, required this.iconPath, required this.description }) : super(key: key);

  final String iconPath;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30),
            child: SvgPicture.asset(iconPath, height: 180, width: 180),
          ),

          Text(
            description, 
            style: TextStyle(fontSize: 20, color: blue),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}