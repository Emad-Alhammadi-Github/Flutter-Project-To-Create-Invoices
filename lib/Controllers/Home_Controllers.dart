
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../sqlDB+ALL.dart';
import 'contact.dart';

class Home_controllers extends GetxController {
  sqlDb sql = sqlDb();

  TextEditingController target = TextEditingController();
  List data = [];
  List data20 = [];
  bool lodding = true;

  Get_Data() async {
    lodding = true;
    data.clear();
    var result = await sql.select("Select * from category order by id desc");
    data.addAll(result);
    lodding = false;
    update();
  }

  var date_Time = DateTime.now();

  void Date_Picker(context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2050),
    ).then((value) {
      if (value == null) {
        return;
      }
      date_Time = value;
      update();
    });
  }

  Delete_Clint(name) async {
    await sql.delete_plus("category", "name ='$name'");
    await sql.delete_plus("db", "cat ='$name'");
    Get_Data();
    Get.back();
  }

  Future<List<Contact>> searchContacts(String keyword) async {
data20.clear();

    List<Map<String, dynamic>> allRows = await sql.select('''
    Select * from category 
    WHERE name LIKE "%$keyword%"
    ''') ;
    data20.addAll(allRows);
    List<Contact> contacts =
    allRows.map((contact) => Contact.fromMap(contact)).toList();
    return contacts;
  }

}
