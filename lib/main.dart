import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Home.dart';
import 'language/langug.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: translation(),
      locale: Locale("ar"),//Get.deviceLocale,//لغه علئ حسب لغه الجهاز
      fallbackLocale: Locale("ar"),// in error
      debugShowCheckedModeBanner: false,
      home: Home()
    );
  }
}
