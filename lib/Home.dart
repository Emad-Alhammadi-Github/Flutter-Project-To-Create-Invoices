import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incpi/Account_Clinet.dart';
import 'package:incpi/Add_New_Clinet.dart';
import 'package:incpi/search_contacts.dart';
import 'package:incpi/widget/Card_Clint.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Controllers/Home_Controllers.dart';

class Home extends StatelessWidget {
  Color co1 = Color.fromRGBO(237, 125, 49, .9);
  Color co2 = Color.fromRGBO(251, 228, 214, 1.0);

  Home_controllers _home_controllers = Get.put(Home_controllers());

  @override
  Widget build(BuildContext context) {
    _home_controllers.Get_Data();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            FloatingActionButton(
                onPressed: () {
                  Get.to(() => Add_New_Clinet(), transition: Transition.size);
                },
                tooltip: "أضافه حساب جديد",
                backgroundColor: const Color.fromRGBO(239, 89, 41, 1),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 35,
                )),
            FloatingActionButton(
              heroTag: 'Search',
              tooltip: "البحث عن الجهه",

              backgroundColor: const Color.fromRGBO(239, 89, 41, 1),
              onPressed: () {
                Get.to(() => SearchPage(), transition: Transition.size);
              },
              child: Icon(Icons.search),
            ),

          ],
        ),
      ),
      body: SafeArea(
          child: GetBuilder(
        init: Home_controllers(),
        builder: (con) => _home_controllers.lodding
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  _home_controllers.data.length == 0
                      ? Center(
                          child: Container(
                              margin: EdgeInsets.only(top: 270),
                              child: Text(
                                "اضغط علئ علامه ( + ) لاضافه بيانات ",
                                style: TextStyle(
                                    fontSize: 22, color: Colors.grey[500]),
                              )),
                        )
                      : Expanded(
                          child: Container(
                          child: ListView.builder(
                              itemCount: _home_controllers.data.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Get.to(() => Account_Clinet(
                                        name_c:
                                            " ${_home_controllers.data[index]["name"]}"));
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
                                              _home_controllers.Delete_Clint("${_home_controllers.data[index]["name"]}");
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
                                          "${_home_controllers.data[index]["name"]}",
                                      price:
                                          "${_home_controllers.data[index]["name"]}"),
                                );
                              }),
                        )), // Card_clint()
                  InkWell(
                      onTap: (){

                        Get.defaultDialog(
                            title: "فريق التطوير",
                            content: Column(children: [
                              InkWell(onTap: (){launch("tel:775516215");},child: Text("775516215",style: TextStyle(decoration: TextDecoration.underline,color: Colors.blueAccent),)),
                              SizedBox(height: 10,),

                              InkWell(onTap: (){launch("tel:775771051");},child: Text("775771051",style: TextStyle(decoration: TextDecoration.underline,color: Colors.blueAccent),)),
                              SizedBox(height: 10,),

                              InkWell(onTap: (){launch("tel:775225183");},child: Text("775225183",style: TextStyle(decoration: TextDecoration.underline,color: Colors.blueAccent),)),
                            ],)
                        );
                      },
                      child: Text("فريق التطوير"))
                ],
              ),
      )),
    );
  }
}
