import 'package:flutter/material.dart';

class Card_clint extends StatelessWidget {
  final String name;
  final String price;

  const Card_clint({super.key, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    Color co1 = Color.fromRGBO(237, 125, 49, .9);

    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black54, offset: Offset(0, 0), blurRadius: 10)
          ]),
      child: Row(children: [
        Container(
            height: 60,
            width: 10,

            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: co1,
            )),
        SizedBox(width: 12,),
        Text(
          "$name",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),

      ]),
    );
  }
}
