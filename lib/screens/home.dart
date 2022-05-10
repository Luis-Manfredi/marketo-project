import 'package:flutter/material.dart';
import 'package:marketo/components/card_add.dart';
import 'package:marketo/components/curve_widget.dart';
import 'package:marketo/constants/colors.dart';
import 'package:marketo/data/lists_class.dart';
import 'package:marketo/data/user_data.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List lists = userLists;

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
}

Widget userListBuilder() => ListView.builder(
  itemCount: userLists.length,
  itemBuilder: (BuildContext context, index) {
    Size size = MediaQuery.of(context).size;
    int productsLength =  userLists[index].products.length;

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton(
        onPressed: (){}, 
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
);