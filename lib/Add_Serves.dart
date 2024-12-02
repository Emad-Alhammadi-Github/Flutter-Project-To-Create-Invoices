import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incpi/Account_Clinet.dart';
import 'package:incpi/widget/MyApper.dart';
import 'package:incpi/widget/Text_Filed.dart';

import 'Controllers/Add_Serves_Controoler.dart';

class Add_Serves extends StatelessWidget {
  final String name;

   Add_Serves({super.key, required this.name});

  Color co1 = Color.fromRGBO(239, 89, 41, 1);
  late DateTime selectedDatef;

  Add_Serves_Controoler _controoler = Get.put(Add_Serves_Controoler());
  // void _handleEnterPressed() {
  //   final currentText = _controoler.name.text;
  //   final newText = currentText + '\n'; // إضافة سطر جديد
  //   _controoler.name.text = newText;
  //   _controoler.name.selection = TextSelection.fromPosition(
  //     TextPosition(offset: newText.length),
  //   ); // تحريك المؤشر إلى نهاية النص
  // }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: SafeArea(
      child: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyApper(),
                Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 40, bottom: 40),
                    alignment: Alignment.center,
                    child: Text(
                      "أضافه خدمه جديده",
                      style: TextStyle(
                          fontSize: 40, color: co1, fontFamily: "Cairo"),


                    )),



                Text_Flied(
                    controller_: _controoler.name,
                    keyboardType_: TextInputType.multiline,

                    labelText: "الخدمه",
                    maxLines: 2),
                Text_Flied(
                    controller_: _controoler.price,
                    keyboardType_: TextInputType.number,
                    labelText: "السعر",
                    maxLines: 1),
                Text_Flied(
                    controller_: _controoler.note,
                    keyboardType_: TextInputType.multiline,
                    labelText: "ملاحظات",
                    maxLines: 3),
                InkWell(
                  onTap: (){
                    _controoler.Add_Servies(this.name);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    margin: EdgeInsets.all(50),
                    decoration: BoxDecoration(
                        color: co1,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 0),
                              blurRadius: 10)
                        ]),
                    child: const Center(
                      child: Text(
                        "أضافه",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontFamily: "Cairo"),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ), onWillPop: ()async{
    return await  Get.off(()=>Account_Clinet(name_c: this.name));
    });
  }
}
