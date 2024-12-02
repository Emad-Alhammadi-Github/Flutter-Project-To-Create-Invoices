import 'package:flutter/material.dart';

class MyApper extends StatelessWidget {
  const MyApper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return                 Container(
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
    )
    ;
  }
}
