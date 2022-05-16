import 'package:flutter/material.dart';
import 'package:marketo/components/add_product_button.dart';
import 'package:marketo/components/bottom_nav_bar.dart';
import 'package:marketo/components/close_button.dart';
import 'package:marketo/components/menu_new_list.dart';
import 'package:marketo/components/new_list_box.dart';
import 'package:marketo/constants/colors.dart';
import 'package:marketo/data/list_item_class.dart';
import 'package:marketo/data/lists_class.dart';
import 'package:marketo/data/user_data.dart';
import 'package:marketo/screens/home.dart';

class NewList extends StatefulWidget {
  const NewList({ Key? key }) : super(key: key);

  @override
  State<NewList> createState() => _NewListState();
}

class _NewListState extends State<NewList> {

  //Initialization

  bool isTapped = false;
  String name = listName;
  int index = 0;
  late TextEditingController _controller;
  final listKey = GlobalKey<State>();

  List<ListItem> productsList = products;

  @override
  void initState(){
    super.initState();
    _controller = TextEditingController();

    // name = UserSimplePreferences.getListName() ?? 'My New List';
  
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  showSnackBar(context){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: white,
        duration: const Duration(seconds: 2),
        content: Text('Item deleted', style: TextStyle(color: blue, fontWeight: FontWeight.w500))
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: white,

      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: white),
          onPressed: () {
            if (productsList.isEmpty){
              Navigator.pop(context);
            }
            else{
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
            }
          },
        ),
        centerTitle: true,
        title: Text(name, style: TextStyle(color: white, fontWeight: FontWeight.w400)),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: PopupMenuButton<MenuItem>(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                ...MenuItemList.itemOptions.map(buildItem).toList(),
                const PopupMenuDivider(),
                ...MenuItemList.closeOption.map(buildItem).toList()
              ]
            ),
          )
        ],
        backgroundColor: blue,
      ),

      body: Container(
        color: white,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: CustomBottomNavBar(size: size)
            ),

            NewListBox(listBuilder: listBuilder(), addButton: AddProductButton(size: size)),
          ],
        ),
      ),
    );
  }

  //Popup menu item builder
  PopupMenuItem<MenuItem> buildItem(MenuItem item) {
    return PopupMenuItem(
      value: item,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(child: item.icon, margin: const EdgeInsets.only(right: 10)),
          Text(item.text, style: TextStyle(color: blue, fontSize: 12))
        ],
      )
    );
  }

  //Popup menu selector manager
  void onSelected(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItemList.changeName:
        showNameDialog();
        break;

      case MenuItemList.clearList:
        clear();
        break;

      case MenuItemList.saveList:
        save();
        break;

      case MenuItemList.close:
        break;
    }
  }

  //List View
  Widget listBuilder() => ListView.separated(
    separatorBuilder: (context, index) => Divider(color: grey.withOpacity(0.5)),
      key: listKey,
      itemCount: productsList.length,
      itemBuilder: (BuildContext context, index) {

        return Container(
          margin: const EdgeInsets.only(bottom: 2),
          child: ListTile(
            selectedColor: grey.withOpacity(0.25),
            focusColor: grey.withOpacity(0.25),
            minVerticalPadding: 0,
            dense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 5),
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
                    onTap: () => removeItem(index),
                    child: Icon(Icons.close_rounded, size: 20, color: blue),
                  ),
                )
              ],
            ),
          ),
        );
      }
    );

  //Show Dialog
  showMenuDialog(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return showDialog<String?>(
      context: context,
      builder: (context) => Dialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 24),
            backgroundColor: white,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Container(
              padding: const EdgeInsets.all(20),
              height: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Change List Name',
                          style: TextStyle(color: blue, fontSize: 20)),
                      const CustomCloseButton()
                    ],
                  ),
                  Container(
                    width: size.width,
                    decoration: BoxDecoration(
                        color: grey.withOpacity(0.4),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15))),
                    child: TextField(
                      textCapitalization: TextCapitalization.words,
                      controller: _controller,
                      onSubmitted: (_) => submit(),
                      style: TextStyle(color: blue, fontSize: 14),
                      decoration: InputDecoration(
                          hintText: 'New name',
                          hintStyle: TextStyle(color: grey, fontSize: 14),
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 20)),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: submit,
                    child: Text('Confirm', style: TextStyle(color: white, fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                        primary: blue,
                        minimumSize: Size(size.width, 50),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                  )
                ],
              ),
            ),
          )
    );
  }

  //Show change name dialog
  void showNameDialog() async {
    final name = await showMenuDialog(context);
    if (name == null || name.isEmpty) return;

    setState(() {
      this.name = name;
      listName = name;
    });
}

  //Clear List function
  void clear() async {
    setState(() {
      listName = 'My New List';
      name = 'My New List';
      products.clear();
    });

    await UserSimplePreferences.setListName(name);
  }

  //Save List function
  void save() async {
    // await UserSimplePreferences.setListName(name);

    if (productsList.isNotEmpty) {
      final List<ListItem> list = [];

      for (var item in productsList){
        list.add(item);
      }

      setState(() {
        userLists.add(
          UserList(name: name, products: list)
        );
      });
    }
  }

  //Submit function
  void submit() {
    Navigator.of(context).pop(_controller.text);

    _controller.clear();
  }

  //Remove
  void removeItem(int index){
    setState(() {
      productsList.removeAt(index);
    });

    showSnackBar(context);
  }

}