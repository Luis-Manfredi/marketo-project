import 'package:flutter/material.dart';
import 'package:marketo/constants/colors.dart';
import 'package:marketo/data/list_item_class.dart';

class ListViewItems extends StatefulWidget {
  const ListViewItems({ Key? key, required this.function }) : super(key: key);

  final VoidCallback function;

  @override
  State<ListViewItems> createState() => _ListViewItemsState();
}

class _ListViewItemsState extends State<ListViewItems> {

  List<ListItem> productsList = products;
  final listKey = GlobalKey<State>();

  @override
  Widget build(BuildContext context) {

      Widget listBuilder() => ListView.builder(
      key: listKey,
      itemCount: productsList.length,
      itemBuilder: (BuildContext context, index) {

        return Container(
          decoration: BoxDecoration(
            color: grey.withOpacity(0.25),
            borderRadius: const BorderRadius.all(Radius.circular(15))
          ),
          margin: const EdgeInsets.only(bottom: 5),
          child: ListTile(
            selectedColor: grey.withOpacity(0.25),
            focusColor: grey.withOpacity(0.25),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 100,
                  child: Text(
                    productsList[index].name, 
                    style: TextStyle(fontSize: 14, color: blue),
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                  )
                ),
                Text(productsList[index].quantity, style: TextStyle(fontSize: 14, color: blue)),
                Text(productsList[index].weight, style: TextStyle(fontSize: 14, color: blue)),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: GestureDetector(
                    onTap: () => widget.function,
                    child: Icon(Icons.close_rounded, size: 20, color: blue),
                  ),
                )
              ],
            ),
          ),
        );
      }
    );

    return listBuilder();
  }
}