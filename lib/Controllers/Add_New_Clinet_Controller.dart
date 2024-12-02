import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:incpi/Home.dart';
import 'package:incpi/sqlDB+ALL.dart';

class Add_New_Clinet_Controller extends GetxController {
  sqlDb sql = sqlDb();
  TextEditingController name = TextEditingController();

  Add_Clinet() async {
    if (name.text != "") {
      var ruslt = await sql.insert_plus("category", {"name": "${name.text}"});
      print(ruslt);
      if(ruslt>0){
        Get.off(()=>Home(),transition: Transition.size);
      }
    }
    else{
      Get.snackbar("تنبيه", "أدخل البيانات بشكل صحيح..",
          backgroundColor: Color.fromRGBO(237, 125, 49, .7),
          snackPosition: SnackPosition.TOP);
    }
  }
}
