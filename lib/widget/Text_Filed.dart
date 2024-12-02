import 'package:flutter/material.dart';

class Text_Flied extends StatelessWidget {
  final TextEditingController controller_;
  final TextInputType keyboardType_;
  final String labelText;
  final int maxLines;

  const Text_Flied({super.key, required this.controller_, required this.keyboardType_, required this.labelText, required this.maxLines});



  @override
  Widget build(BuildContext context) {
    Color co1 = Color.fromRGBO(239, 89, 41, 1);

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 20),
      child: TextField(
          controller: controller_,

          maxLines: maxLines,
          keyboardType: keyboardType_,
          onChanged: (value) {
        // تحقق إذا تجاوز النص المساحة المتاحة
        if (controller_.text.length > controller_.selection.base.offset) {
      // إذا تجاوز النص المساحة، قم بإضافة سطر جديد
      controller_.text += '\n';
      controller_.selection = TextSelection.fromPosition(
        TextPosition(offset: controller_.text.length),
      );
    }
  },
          decoration: InputDecoration(
              label: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(labelText),
              ) ,
              labelStyle: TextStyle(color: co1, fontSize: 20,fontFamily: "Cairo"),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50), gapPadding: 10),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50), gapPadding: 10))),
    );
  }
}
