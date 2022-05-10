import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:marketo/components/close_button.dart';
import 'package:marketo/constants/colors.dart';
import 'package:marketo/data/list_item_class.dart';

class AddProductButton extends StatefulWidget {
  const AddProductButton({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<AddProductButton> createState() => _AddProductButtonState();
}

class _AddProductButtonState extends State<AddProductButton> {

  //Initialization
  late TextEditingController _nameController, _quantityController, _weightController;
  List<ListItem> productsList = products;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();

    _nameController = TextEditingController();
    _quantityController = TextEditingController();
    _weightController = TextEditingController();
  }

  @override
  void dispose(){
    _nameController.dispose();
    _quantityController.dispose();
    _weightController.dispose();

    super.dispose();
  }


  //Button 'Add products'
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        onPressed: () => showAddProductMenu(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Add Item', style: TextStyle(color: white, fontSize: 20)),
              
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
          minimumSize: Size(widget.size.width, 80),
          elevation: 4
        ),
      ),
    );
  }

  //Show Dialog
  showAddProductMenu(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return showDialog(
        context: context,
        builder: (context) => Dialog(
              insetPadding: const EdgeInsets.symmetric(horizontal: 24),
              backgroundColor: white,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Form(
                key: _formKey,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  height: 355,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Add Item', style: TextStyle(color: blue, fontSize: 20)),
                                const CustomCloseButton()
                              ],
                            ),
                          ),
              
                          Stack(
                            children: [
                              Container(
                                height: 48,
                                margin: const EdgeInsets.symmetric(vertical: 10),
                                width: size.width,
                                decoration: BoxDecoration(
                                    color: grey.withOpacity(0.4),
                                    borderRadius: const BorderRadius.all(Radius.circular(15))
                                ),
                              ),

                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 10),
                                width: size.width,
                                color: Colors.transparent,
                                child: TextFormField(
                                  textCapitalization: TextCapitalization.words,
                                  controller: _nameController,
                                  style: TextStyle(color: blue, fontSize: 14),
                                  decoration: InputDecoration(
                                    alignLabelWithHint: true,
                                    hintText: 'Add item name',
                                    hintStyle: TextStyle(color: grey, fontSize: 14),
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                                  ),

                                  validator: (value) => value!.isEmpty || value.length < 3 == true ? 'Must have a valid name' : null,
                                ),
                              ),
                            ],
                          ),
              
                          Container(
                            height: 48,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            width: size.width,
                            decoration: BoxDecoration(
                                color: grey.withOpacity(0.4),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15))),
                            child: TextField(
                              textCapitalization: TextCapitalization.words,
                              controller: _quantityController,
                              style: TextStyle(color: blue, fontSize: 14),
                              decoration: InputDecoration(
                                  hintText: 'Add quantity (optional)',
                                  hintStyle: TextStyle(color: grey, fontSize: 14),
                                  border: InputBorder.none,
                                  contentPadding:
                                      const EdgeInsets.symmetric(horizontal: 20)),
                            ),
                          ),
              
                          Container(
                            height: 48,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            width: size.width,
                            decoration: BoxDecoration(
                                color: grey.withOpacity(0.4),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15))),
                            child: TextField(
                              textCapitalization: TextCapitalization.words,
                              controller: _weightController,
                              style: TextStyle(color: blue, fontSize: 14),
                              decoration: InputDecoration(
                                  hintText: 'Add item weight (optional)',
                                  hintStyle: TextStyle(color: grey, fontSize: 14),
                                  border: InputBorder.none,
                                  contentPadding:
                                      const EdgeInsets.symmetric(horizontal: 20)),
                            ),
                          ),
                        ],
                      ),
              
                      ElevatedButton(
                        onPressed: (){
                          final form = _formKey.currentState;
                          if (form!.validate()) return submit();
                        },
                        child: Text('Confirm', style: TextStyle(color: white, fontSize: 18)),
                        style: ElevatedButton.styleFrom(
                          primary: blue,
                          minimumSize: Size(size.width, 50),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15))
                          )
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }

  //Add Product
  void submit() {
    Navigator.of(context).pop([_nameController, _quantityController, _weightController]);

    setState(() {
      productsList.add(
        ListItem(
          name: _nameController.text.toString(), 
          quantity: _quantityController.text.toString(), 
          weight: _weightController.text.toString())
      );

      log('product added');
    });

    _nameController.clear();
    _quantityController.clear();
    _weightController.clear();
  }
}