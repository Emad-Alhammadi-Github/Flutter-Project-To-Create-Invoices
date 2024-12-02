import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Account_Clinet.dart';
import '../Controllers/Home_Controllers.dart';
import '../Controllers/contact.dart';
import 'Card_Clint.dart';


class ContactsList extends StatelessWidget {
  List<Contact> contacts;


  ContactsList(List<Contact> this.contacts);
  Color co1 = Color.fromRGBO(237, 125, 49, .9);
  Color co2 = Color.fromRGBO(251, 228, 214, 1.0);

  Home_controllers _home_controllers = Get.put(Home_controllers());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: contacts.length,
        itemBuilder: (BuildContext context, int index) {
          final contact = contacts![index];
          return InkWell(
            onTap: () {
              Get.to(() => Account_Clinet(
                  name_c:
                  " ${contact.name}"));
            },
            onLongPress: (){
              Get.defaultDialog(
                title: "تنبيه",
                middleText:
                "أنت علئ وشك الحذف !",
                confirm: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        _home_controllers.Delete_Clint("${contact.name}");
                        Get.back();
                      },
                      child: Container(
                        width: 100,
                        height: 50,
                        margin:
                        EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(width: 2,color: Color.fromRGBO(
                              237,
                              125,
                              49,
                              .7)),
                          borderRadius:
                          BorderRadius
                              .circular(30),
                        ),
                        child: Center(
                            child: Text(
                              "موافق ",
                              style: TextStyle(
                                  fontSize: 20),
                            )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        width: 100,
                        height: 50,
                        margin:
                        EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius
                                .circular(30),
                            color: Color.fromRGBO(
                                237,
                                125,
                                49,
                                .7)),
                        child: Center(
                            child: Text(
                              "ألغاء ",
                              style: TextStyle(
                                  fontSize: 20),
                            )),
                      ),
                    ),
                  ],
                ),
              );







            },
            child: Card_clint(
                name:
                "${contact.name}",
                price:
                "${_home_controllers.data[index]["name"]}"),
          );
        },
      ),
    );
  }
}










