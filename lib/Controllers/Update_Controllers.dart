import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incpi/Account_Clinet.dart';
import '../Home.dart';
import '../sqlDB+ALL.dart';

class Update_controllers extends GetxController {
  sqlDb sql = sqlDb();

  TextEditingController name = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController price = TextEditingController();



  Update_Data(id,cat)async{
    if (name.text == "" && price.text == "") {
      Get.snackbar("تنبيه", "أدخل البيانات بشكل صحيح..",
          backgroundColor: const Color.fromRGBO(237, 125, 49, .7),
          snackPosition: SnackPosition.TOP);
    } else {
      var ruslt = await sql.updata_plus("db", {
        "serves": name.text,
        "notes": note.text,
        "price": price.text,
      },"id = $id");
      if (ruslt > 0) {
        Get.off(() => Account_Clinet(name_c: cat), transition: Transition.size);
      }
    }
  }
}

