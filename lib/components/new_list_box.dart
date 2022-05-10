import 'package:flutter/material.dart';
import 'package:marketo/constants/colors.dart';
import 'package:marketo/data/list_item_class.dart';

class NewListBox extends StatefulWidget {
  const NewListBox({ Key? key, required this.listBuilder, required this.addButton }) : super(key: key);

  final Widget listBuilder;
  final Widget addButton;

  @override
  State<NewListBox> createState() => _NewListBoxState();
}

class _NewListBoxState extends State<NewListBox> {

  List<ListItem> productsList = products;
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            height: size.height * 0.5,
            width: size.width,
            decoration: BoxDecoration(
              color: white,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                  color: black.withOpacity(0.15),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(0, 2)
                )
              ]
            ),
      
            child: productsList.isEmpty ? Center(
              child: Text(
                'Whoops! Seems you have nothing on the list yet!', 
                style: TextStyle(fontSize: 20, color: blue),
                textAlign: TextAlign.center,
              ),
            ) : widget.listBuilder 
          ),

          widget.addButton
        ],
      ),
    );
  }
}