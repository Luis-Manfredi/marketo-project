import 'package:flutter/material.dart';
import 'package:marketo/components/dialog_action_button.dart';
import 'package:marketo/constants/colors.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({Key? key, required this.functionOne}) : super(key: key);

  // final int index;
  final VoidCallback functionOne;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      backgroundColor: white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      title: Text('Delete', style: TextStyle(color: blue, fontSize: 20)),
      content: Text('Are you sure you want to delete this list?', style: TextStyle(color: blue)),
      actionsPadding: const EdgeInsets.all(10),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DialogActionButton(function: () => Navigator.pop(context), text: 'Cancel', backgroundColor: blue),
            DialogActionButton(function: functionOne, text: 'Accept', backgroundColor: grey),
          ],
        ),
      ],
    );
  }
}
