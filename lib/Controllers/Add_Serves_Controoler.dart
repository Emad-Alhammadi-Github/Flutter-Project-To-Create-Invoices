import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:incpi/Account_Clinet.dart';

import '../Home.dart';
import '../sqlDB+ALL.dart';

class Add_Serves_Controoler extends GetxController {
  sqlDb sql = sqlDb();

  TextEditingController name = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController selectdata = TextEditingController();

  Add_Servies(String cat) async {

    if (name.text == "" && price.text == "") {
      Get.snackbar("تنبيه", "أدخل البيانات بشكل صحيح..",
          backgroundColor: Color.fromRGBO(237, 125, 49, .7),
          snackPosition: SnackPosition.TOP);
    } else {
      var ruslt = await sql.insert_plus("db", {
        "serves": name.text,
        "notes": note.text,
        "price": price.text,
        "cat": cat,
      });
      print(ruslt);
      if (ruslt > 0) {
        Get.off(() => Account_Clinet(name_c: cat), transition: Transition.size);
      }
    }
  }
}
