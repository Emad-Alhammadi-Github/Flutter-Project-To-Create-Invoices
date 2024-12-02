import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incpi/widget/contact_list.dart';
import 'Controllers/Home_Controllers.dart';

class SearchPage extends StatefulWidget {
  SearchPage({
    Key? key,
  }) : super(
    key: key,
  );

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Home_controllers _home_controllers = Get.put(Home_controllers());

  String keyword="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(237, 125, 49, .9),
        title: Text('البحث عن طريق اسم الجهه'),
        leading: GestureDetector(
          onTap: () {

            Get.back();
          },
          child: Icon(
            Icons.arrow_back, // add custom icons also
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    cursorColor:Color.fromRGBO(237, 125, 49, .9),
                  decoration: InputDecoration(
                      // focusColor:Colors.orange,
                      // fillColor:Colors.orange,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:Color.fromRGBO(237, 125, 49, .9)
                        ),
                      ),
                      border: OutlineInputBorder(

                      ), labelText: 'keyword',labelStyle:TextStyle(color: Color.fromRGBO(237, 125, 49, .9))),
                  onChanged: (value) {
                    keyword = value;
                    setState(() {

                    });
                  },
                ),
              ),
              FutureBuilder(
                future:  _home_controllers.searchContacts(keyword),

                builder: (context, snapshot) {
                  if (snapshot.hasError) print('error');
                  var data = snapshot.data;
                  return snapshot.hasData ? ContactsList(data!) : new Center(child: Text('No contacts that include this keyword'),);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
