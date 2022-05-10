import 'package:flutter/material.dart';
import 'package:marketo/components/curve_widget.dart';
import 'package:marketo/constants/colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({ Key? key, required this.size }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {

    return Stack(
        children: [
          CurveWidget(size: size, clipperSize: 150),

          Positioned(
            bottom: 0,
            child: SizedBox(
              width: size.width,
              height: 70,
              child: BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.list),
                    label: 'List'
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.attach_money_rounded),
                    label: 'Pricing'
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.category_rounded),
                    label: 'Categories'
                  )
                ],
                backgroundColor: blue,
                elevation: 0,
                unselectedIconTheme: IconThemeData(color: grey),
                unselectedItemColor: grey,
                selectedItemColor: white,
                selectedIconTheme: IconThemeData(color: white),
              ),
            ),
          ),
        ],
      );
  }
}