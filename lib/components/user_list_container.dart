import 'package:flutter/material.dart';
import 'package:marketo/constants/colors.dart';
import 'package:marketo/data/lists_class.dart';

class UserListContainer extends StatelessWidget {
  const UserListContainer({ Key? key, required this.showDialogFunction, required this.index }) : super(key: key);

  final VoidCallback showDialogFunction;
  final int index;

  @override
  Widget build(BuildContext context) {
    int productsLength =  userLists[index].products.length;
    Size size = MediaQuery.of(context).size;

    return Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ElevatedButton(
          onPressed: showDialogFunction, 
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(userLists[index].name, style: TextStyle(color: blue, fontSize: 18)),
              productsLength < 2 ? 
              Text('${productsLength.toString()} item', style: TextStyle(color: grey, fontSize: 18)) :
              Text('${productsLength.toString()} items', style: TextStyle(color: grey, fontSize: 18))
            ],
          ),

          style: ElevatedButton.styleFrom(
            primary: white,
            onPrimary: white,
            elevation: 4,
            minimumSize: Size(size.width, 80),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))
            )
          ),
        ),
      );
  }
}