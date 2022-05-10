import 'package:flutter/material.dart';
import 'package:marketo/components/curve.dart';
import 'package:marketo/constants/colors.dart';

class CurveWidget extends StatelessWidget {
  const CurveWidget({
    Key? key,
    required this.size, required this.clipperSize,
  }) : super(key: key);

  final Size size;
  final double clipperSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: blue,
          height: 200,
          width: size.width,
        ),

        ClipPath(
          clipper: MyCurve(),
          child: Container(
            color: white,
            height: clipperSize,
            width: size.width,
          ),
        )
      ],
    );
  }
}
