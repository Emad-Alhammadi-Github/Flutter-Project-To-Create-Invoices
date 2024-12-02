import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incpi/Controllers/Get_Data_Clinet_Controoler.dart';
import 'package:incpi/widget/MyApper.dart';
import 'package:incpi/widget/Text_Filed.dart';
import 'package:intl/intl.dart';
import 'Add_Serves.dart';
import 'Controllers/Home_Controllers.dart';
import 'widget/Table_Data.dart';

class Account_Clinet extends StatelessWidget {
  final String name_c;

  Account_Clinet

  ({super.key, required this.name_c});

  @override
  Color co1 = Color.fromRGBO(237, 125, 49, .9);
  Color co2 = Color.fromRGBO(251, 228, 214, 1.0);

  Get_Data_Clinet_Controller controller = Get.put(Get_Data_Clinet_Controller());
  Home_controllers _home_controllers = Get.put(Home_controllers());

  Widget build(BuildContext context) {
    controller.Get_All_Data(this.name_c);
    return Scaffold(
      body: SafeArea(
          child: GetBuilder(
            init: Get_Data_Clinet_Controller(),
            builder: (con) =>
            controller.lodding
                ? Center(
              child: CircularProgressIndicator(),
            )
                : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyApper(),
                Container(
                    width: double.infinity,
                    // margin: EdgeInsets.only(top: 5, bottom: 5),
                    alignment: Alignment.center,
                    child: Text(
                      "${this.name_c}",
                      style: TextStyle(
                          fontSize: 25, color: co1, fontFamily: "Cairo"),
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(8, 20, 8, 0),
                    child: controller.data.length > 0
                        ? Table_Data(
                        isSmoll: false,
                        color: co1,
                        serves: "الخدمة",
                        price: "السعر",
                        note: "ملاجظات")
                        : Center(
                      child: Container(
                          margin: EdgeInsets.only(top: 270),
                          child: Text(
                            "اضغط علئ علامه ( + ) لاضافه بيانات ",
                            style: TextStyle(
                                fontSize: 22, color: Colors.grey[500]),
                          )),
                    )),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                        padding: EdgeInsets.all(8),
                        itemCount: controller.data.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onLongPress: () {
                              Get.dialog(Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 80, vertical: 320),
                                width: double.infinity,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: MaterialButton(
                                          onPressed: () {
                                            controller.Update_Date(
                                                controller.data[index]["id"],
                                                "${controller.data[index]["serves"]}",
                                                "${controller.data[index]["price"]}",
                                                "${controller.data[index]["notes"]}",
                                              this.name_c

                                                );
                                          },
                                          child: Container(
                                            margin: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(20),
                                                color: Colors.blue),
                                            child: const Center(
                                              child: Text(
                                                "تعديل",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    decoration:
                                                    TextDecoration.none),
                                              ),
                                            ),
                                          ),
                                        )),
                                    Divider(
                                        color: co1,
                                        thickness: 3,
                                        endIndent: 5,
                                        indent: 5),
                                    Expanded(
                                        child: MaterialButton(
                                          onPressed: () {
                                            controller.Delete_Data(
                                                controller.data[index]["id"],
                                                "${this.name_c}");
                                          },
                                          child: Container(
                                            margin: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(20),
                                                color: Colors.red),
                                            child: Center(
                                              child: Text(
                                                "حذف",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    decoration:
                                                    TextDecoration.none),
                                              ),
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ));
                            },
                            child: Table_Data(
                                isSmoll: true,
                                color: index % 2 == 0 ? co2 : Colors.white,
                                serves: "${controller.data[index]["serves"]}",
                                price:
                                " ${controller.data[index]["price"]} \$",
                                note: "${controller.data[index]["notes"]}"),
                          );
                        }),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 65,
                  decoration: const BoxDecoration(
                      color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 0),
                        blurRadius: 15)
                  ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.off(() => Add_Serves(name: this.name_c),
                              transition: Transition.size);
                        },
                        child: Container(
                          width: 55,
                          height: 55,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: co1,
                              borderRadius: BorderRadius.circular(200)),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              size: 45,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "ألاجمالي",
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[500]),
                          ),
                          Text(
                            controller.sum_price.length == 0
                                ? "0"
                                : "\$${controller.sum_price[0]["sum"]}",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),

                     InkWell(
                       onTap: (){
                         Get.defaultDialog(
                             title: "تنبيه",
                             backgroundColor: Colors.white,
                             content: Column(
                               mainAxisSize:
                               MainAxisSize.min,
                               children: [
                                 Text_Flied(
                                     controller_:
                                     controller.titels,

                                     keyboardType_:
                                     TextInputType.name,
                                     labelText: "العنوان",
                                     maxLines: 1),

                                 Padding(
                                   padding: const EdgeInsets
                                       .symmetric(
                                       horizontal: 30),
                                   child: InkWell(
                                     onTap: () {
                                       controller
                                           .Date_Picker(
                                           context);
                                     },
                                     child: Row(
                                       mainAxisAlignment:
                                       MainAxisAlignment
                                           .spaceBetween,
                                       children: [
                                         Icon(
                                           Icons
                                               .calendar_month_outlined,
                                           color: co1,
                                         ),
                                         GetBuilder(
                                             init:
                                             Home_controllers(),
                                             builder: (cont) =>
                                                 Text(
                                                     "${DateFormat.yMEd().format(cont.date_Time)}"))
                                       ],
                                     ),
                                   ),
                                 ),



                                 InkWell(
                                   onTap: () {
                                     controller
                                         .Get_BDF(this.name_c);
                                   },
                                   child: Container(
                                     width: double.infinity,
                                     height: 50,
                                     margin:
                                     EdgeInsets.all(20),
                                     decoration: BoxDecoration(
                                         borderRadius:
                                         BorderRadius
                                             .circular(
                                             30),
                                         color:
                                         Color.fromRGBO(
                                             237,
                                             125,
                                             49,
                                             .7)),
                                     child: Center(
                                         child: Text(
                                           "طباعه ",
                                           style: TextStyle(
                                               fontSize: 22),
                                         )),
                                   ),
                                 )
                               ],
                             ));
                       },
                       child:Image.asset(
                         "Assets/pdf.png",
                         width: 55,
                       ) ,
                     ),



                      // InkWell(
                      //   onTap: (){
                      //     InkWell(
                      //         onTap: () {
                      //           Get.defaultDialog(
                      //               title: "تنبيه",
                      //               backgroundColor: Colors.white,
                      //               content: Column(
                      //                 mainAxisSize:
                      //                 MainAxisSize.min,
                      //                 children: [
                      //                   Text_Flied(
                      //                       controller_:
                      //                       controller.titels,
                      //
                      //                       keyboardType_:
                      //                       TextInputType.name,
                      //                       labelText: "العنوان",
                      //                       maxLines: 1),
                      //
                      //                   Padding(
                      //                     padding: const EdgeInsets
                      //                         .symmetric(
                      //                         horizontal: 30),
                      //                     child: InkWell(
                      //                       onTap: () {
                      //                         controller
                      //                             .Date_Picker(
                      //                             context);
                      //                       },
                      //                       child: Row(
                      //                         mainAxisAlignment:
                      //                         MainAxisAlignment
                      //                             .spaceBetween,
                      //                         children: [
                      //                           Icon(
                      //                             Icons
                      //                                 .calendar_month_outlined,
                      //                             color: co1,
                      //                           ),
                      //                           GetBuilder(
                      //                               init:
                      //                               Home_controllers(),
                      //                               builder: (cont) =>
                      //                                   Text(
                      //                                       "${DateFormat.yMEd().format(cont.date_Time)}"))
                      //                         ],
                      //                       ),
                      //                     ),
                      //                   ),
                      //
                      //
                      //
                      //                   InkWell(
                      //                     onTap: () {
                      //                       controller
                      //                           .Get_BDF();
                      //                     },
                      //                     child: Container(
                      //                       width: double.infinity,
                      //                       height: 50,
                      //                       margin:
                      //                       EdgeInsets.all(20),
                      //                       decoration: BoxDecoration(
                      //                           borderRadius:
                      //                           BorderRadius
                      //                               .circular(
                      //                               30),
                      //                           color:
                      //                           Color.fromRGBO(
                      //                               237,
                      //                               125,
                      //                               49,
                      //                               .7)),
                      //                       child: Center(
                      //                           child: Text(
                      //                             "طباعه ",
                      //                             style: TextStyle(
                      //                                 fontSize: 22),
                      //                           )),
                      //                     ),
                      //                   )
                      //                 ],
                      //               ));
                      //         },
                      //         child: _home_controllers.data.length >
                      //             0
                      //             ? Container(
                      //           width: double.infinity,
                      //           height: 50,
                      //           margin: EdgeInsets.all(20),
                      //           decoration: BoxDecoration(
                      //               borderRadius:
                      //               BorderRadius.circular(
                      //                   30),
                      //               color: Color.fromRGBO(
                      //                   237, 125, 49, .7)),
                      //           child: const Center(
                      //               child: Text(
                      //                 "طباعه التقرير",
                      //                 style:
                      //                 TextStyle(fontSize: 22),
                      //               )),
                      //         )
                      //             : Container());
                      //   },
                      //   child:Image.asset(
                      //     "Assets/pdf.png",
                      //     width: 55,
                      //   ) ,
                      // ),


                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
