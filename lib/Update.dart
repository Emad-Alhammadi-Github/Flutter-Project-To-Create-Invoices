import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incpi/Account_Clinet.dart';
import 'package:incpi/widget/Text_Filed.dart';

import 'Controllers/Update_Controllers.dart';

class Update extends StatelessWidget {

  final int id;
  final String servies;
  final String cat;
  final String price;
  final String note;

  @override
  Color co1 = Color.fromRGBO(239, 89, 41, 1);

  Update_controllers controller = Get.put(Update_controllers());

   Update({super.key, required this.id, required this.servies, required this.cat, required this.price, required this.note});




  Widget build(BuildContext context) {
    controller.name.text=this.servies;
    controller.price.text=this.price;
    controller.note.text=this.note;

    return SafeArea(
      child: Scaffold(
        body: WillPopScope(onWillPop: ()async{
          return await Get.off(()=> Account_Clinet(name_c: this.cat));
        },child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 0),
                            blurRadius: 10)
                      ]),
                  child: Center(
                    child: Image.asset(
                      "Assets/logo.jpg",
                      width: 200,
                    ),
                  ),
                ),
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
                    controller_: controller.name,
                    keyboardType_: TextInputType.name,
                    labelText: "الخدمه",
                    maxLines: 1),
                Text_Flied(
                    controller_: controller.price,
                    keyboardType_: TextInputType.number,
                    labelText: "السعر",
                    maxLines: 1),
                Text_Flied(
                    controller_: controller.note,
                    keyboardType_: TextInputType.text,
                    labelText: "ملاحظات",
                    maxLines: 3),
                InkWell(
                  onTap: () {
                    controller.Update_Data(this.id,this.cat);
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
        ),)
      ),
    );
  }
}
