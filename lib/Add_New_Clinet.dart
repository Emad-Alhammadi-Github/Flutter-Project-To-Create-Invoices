import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incpi/Controllers/Add_New_Clinet_Controller.dart';
import 'package:incpi/widget/Text_Filed.dart';

class Add_New_Clinet extends StatelessWidget {
  Color co1 = Color.fromRGBO(239, 89, 41, 1);

  Add_New_Clinet_Controller controller=Get.put(Add_New_Clinet_Controller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
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
                    labelText: "اسم الملف",
                    maxLines: 1),

                InkWell(
                  onTap: (){
                    controller.Add_Clinet();
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
    );

  }
}
