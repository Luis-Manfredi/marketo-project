import 'package:flutter/material.dart';
import 'package:marketo/components/card_add.dart';
import 'package:marketo/components/close_button.dart';
import 'package:marketo/components/confirmDialog.dart';
import 'package:marketo/components/curve_widget.dart';
import 'package:marketo/components/dialog_action_button.dart';
import 'package:marketo/components/user_list_container.dart';
import 'package:marketo/constants/colors.dart';
import 'package:marketo/data/lists_class.dart';
import 'package:marketo/data/user_data.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: white,

      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: white),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text('My Lists', style: TextStyle(color: white, fontWeight: FontWeight.w400)),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: PopupMenuButton(
              itemBuilder: (context) => []
            ),
          )
        ],
        backgroundColor: blue,

      ),

      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                CardAdd(size: size),
                userLists.isEmpty ? Container() : Container(
                  margin: const EdgeInsets.only(top: 25),
                  height: size.height * 0.5,
                  width: size.width,
                  child: userListBuilder(),
                )
              ],
            ),
          ),

          Positioned(
            bottom: 0,
            child: CurveWidget(size: size, clipperSize: 150),
          )
        ],
      ),
    );
  }

  Widget userListBuilder() => ListView.builder(
    itemCount: userLists.length,
    itemBuilder: (BuildContext context, index) {
      Size size = MediaQuery.of(context).size;
      int productsLength =  userLists[index].products.length;

      //List Dialog
      showListDialog(BuildContext context){
        String userListName = userLists[index].name;
        List productsNames = userLists[index].products;
        return showDialog(
            context: context, 
            builder: (context) => Dialog(
              insetPadding: const EdgeInsets.symmetric(horizontal: 24),
              backgroundColor: white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                height: size.height * 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(userListName, style: TextStyle(color: blue, fontSize: 20)),
                        const CustomCloseButton()
                      ],
                    ),
                    
                    Container(
                      margin: const EdgeInsets.only(bottom: 2),
                      width: size.width,
                      height: size.height * 0.42,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => Divider(color: grey.withOpacity(0.5)),
                        itemCount: productsLength,
                        itemBuilder: (BuildContext context, index) {
                          return ListTile(
                            minVerticalPadding: 0,
                            dense: true,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: Text(productsNames[index].name, style: TextStyle(fontSize: 12, color: blue))
                                ),
                                Text(productsNames[index].quantity, style: TextStyle(fontSize: 12, color: blue)),
                                Container(
                                  alignment: Alignment.centerRight,
                                  width: 50,
                                  child: Text(productsNames[index].weight, style: TextStyle(fontSize: 12, color: blue))
                                )
                              ],
                            ),
                          );
                        }
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DialogActionButton(function: (){}, text: 'Edit', backgroundColor: blue),

                        DialogActionButton(
                          function: () {
                            Navigator.pop(context);
                            confirmDialog(context, index);
                          }, 
                          text: 'Delete', 
                          backgroundColor: grey
                        )
                      ],
                    )
                  ]
                ),
              ),
            )
          );
        }

      return UserListContainer(showDialogFunction: () => showListDialog(context), index: index);
    }
  );

  //Confirmation Dialog
  confirmDialog(BuildContext context, int index) {
    return showDialog(
      context: context, 
      builder: (context) => ConfirmationDialog(functionOne: () => delete(index))
    );
  }

  // Delete userList
  void delete(int index){
    setState(() {
        userLists.removeAt(index);
        Navigator.pop(context);
    });
  } 
}