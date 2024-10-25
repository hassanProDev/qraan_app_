import 'package:flutter/material.dart';
import 'package:quran_app/core/json_key.dart';
import 'package:quran_app/model/ayah_model.dart';
import 'package:quran_app/model/sura_details_model.dart';
import 'package:quran_app/model/sura_page_model.dart';
import 'package:quran_app/util/quran_package/page_data.dart';
import 'package:quran_app/util/quran_package/quran_text.dart';
import 'package:quran_app/view/widget/basmallah.dart';
import 'package:quran_app/view/widget/header_widget.dart';

List<AyahModel> getContentPage(
  int pageNumber,
) {
  // List<String> contentPage = [];
  List<AyahModel> ayahModel=quranText.map((e)=>AyahModel.fromJson(e)).toList();
  List<AyahModel> ayahtOfPage=[];
  for (var page in pageData[pageNumber - 1]) {
   SuraPageModel suraPageModel= SuraPageModel.fromList(page);
   for(int start=suraPageModel.startAyahInPage-1;start<suraPageModel.endAyahInPage;start++){
     ayahtOfPage.add(ayahModel.where((test)=>test.suraNumber==suraPageModel.suraNumber).toList()[start]);
   }
  }
  return ayahtOfPage;
}
// List<InlineSpan> getContentPage(int pageNumber,SuraDetailsModel jsonData,int index) {
//   List<String> contentPage = [];
//   List<InlineSpan> spans =
//   [];
//   for (var e in pageData[pageNumber-1]) {
//     quranText.where((value){
//      return value[KeyManager.surah_number]==e[KeyManager.number];
//     }).toList();
//
//     for(int start=e[KeyManager.start]-1;start<=e[KeyManager.end]-1;start++){
//       contentPage.add(quranText[start]["content"]);
//       // Header
//       if (start == 1) {
//         spans
//             .add(WidgetSpan(
//           child: HeaderWidget(
//               e: e,
//               jsonData:
//                   jsonData),
//         ));
//         if (index != 187 &&
//             index != 1) {
//           spans.add(
//               WidgetSpan(
//                 child: Basmallah(
//                     index: 0),
//               ));
//         }
//         if (index == 187) {
//           spans.add(
//               WidgetSpan(
//                 child:
//                 Container(
//                   height: 22,
//                 ),
//               ));
//         }
//       }
//       // verses
//       spans.add(TextSpan(
//         text:quranText[start]["content"],
//
//         style: TextStyle(
//           color: Colors.black,
//           height: (index ==
//               1 ||
//               index ==
//                   2)
//               ? 20
//               : 12,
//           letterSpacing:
//           0,
//           wordSpacing: 0,
//           fontFamily:
//           "QCF_P${index.toString().padLeft(3, "0")}",
//           fontSize: index ==
//               1 ||
//               index == 2
//               ? 28
//               : index == 145 ||
//               index ==
//                   201
//               ? index == 532 ||
//               index ==
//                   533
//               ? 22.5
//               : 22.4
//
//               : 23.1,
//           backgroundColor:  Colors.transparent,
//         ),
//         children: const <TextSpan>[
//
//         ],
//       ));
//     }
//
//   }
//   return spans;
// }
