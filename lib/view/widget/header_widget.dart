import 'package:flutter/material.dart';
import 'package:quran_app/model/ayah_model.dart';
import 'package:quran_app/model/sura_details_model.dart';
import 'package:quran_app/util/quran_package/quran.dart';

class HeaderWidget extends StatelessWidget {
  AyahModel e;

  HeaderWidget({
    super.key,
    required this.e,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              "assets/images/888-02.png",
              width: MediaQuery.of(context).size.width,
              height: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.7, vertical: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "اياتها\n${getVerseCount(e.suraNumber)}",
                  style: const TextStyle(
                      fontSize: 5, fontFamily: "UthmanicHafs13"),
                ),
                Center(
                    child: RichText(
                        text: TextSpan(
                  text: e.suraNumber.toString(),

                  // textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: "arsura", fontSize: 22, color: Colors.black),
                ))),
                Text(
                  "ترتيبها\n${e.suraNumber}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 5, fontFamily: "UthmanicHafs13"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
