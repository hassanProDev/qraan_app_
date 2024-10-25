import 'package:flutter/material.dart';

class AyahNumber extends StatelessWidget {
  int number;

  AyahNumber({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      width: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/nameborder.png",
          ),
        ),
      ),
      child: Text("${number}",style: TextStyle(fontSize: 16),),
    );
  }
}
