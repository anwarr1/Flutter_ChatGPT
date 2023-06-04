import 'package:Flutter_GPT/consts/global_colors.dart';
import 'package:Flutter_GPT/widgets/dropDownbottomModal.dart';
import 'package:flutter/material.dart';

class Services {
  static Future<void> showBottomModal(BuildContext context) async {
    await showModalBottomSheet(
      backgroundColor: lightGptColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Choose a model :",
                style: TextStyle(color: Colors.white),
              ),
              // Expanded(child:
              DropDownModal()
              //  )
            ],
          ),
        );
      },
    );
  }
}
