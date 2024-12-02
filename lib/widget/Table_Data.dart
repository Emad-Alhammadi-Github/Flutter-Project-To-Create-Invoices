import 'package:flutter/material.dart';

class Table_Data extends StatelessWidget {
  final Color color;
  final String serves;
  final String price;
  final String note;
  final bool isSmoll;

  const Table_Data(
      {super.key,
      required this.color,
      required this.serves,
      required this.price,
      required this.note,
      required this.isSmoll});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Table(
        border: TableBorder.all(color: color),
        children: [
          TableRow(children: [
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(8),
                child: Text(
                  serves,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Cairo",
                      fontSize: isSmoll ? 15 : 20,
                      fontWeight: FontWeight.w700,
                      color: isSmoll ? Colors.black : Colors.white),
                )),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(8),
                child: Text(
                  price,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Cairo",
                      fontSize: isSmoll ? 15 : 20,
                      fontWeight: isSmoll ? FontWeight.w400 : FontWeight.w700,
                      color: isSmoll ? Colors.black : Colors.white),
                )),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(8),
                child:
                      Text(
                        note,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Cairo",
                            fontSize: isSmoll ? 15 : 20,
                            fontWeight: FontWeight.w700,
                            color: isSmoll ? Colors.black : Colors.white),


                )),
          ])
        ],
      ),
    );
  }
}
