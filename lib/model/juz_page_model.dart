import 'package:quran_app/core/json_key.dart';
import 'package:quran_app/model/ayah_model.dart';
import 'package:quran_app/util/helper_method.dart';
import 'package:quran_app/util/quran_package/juz_data.dart';
import 'package:quran_app/util/quran_package/page_data.dart';
import 'package:quran_app/util/quran_package/surah_data.dart';

class JuzPageModel {
  int juzNum;
  int suraNum;
  String suraName;

  JuzPageModel(
      {required this.juzNum, required this.suraNum, required this.suraName});

  factory JuzPageModel.fromPageNum(int page) {
    List<Map> pageDetails = pageData[page - 1];
    List<Map> juzData = [];
    List<int> surNum = [];
    int juzNum;

    Map firstSuraInPage = pageDetails[0];

   // juzNum= juz.firstWhere((e) {
   //    return e[KeyManager.verses][firstSuraInPage[KeyManager.surah]][0] >=
   //            firstSuraInPage[KeyManager.start] &&
   //        e[KeyManager.verses][firstSuraInPage[KeyManager.surah]][1] <=
   //            firstSuraInPage[KeyManager.end];
   //  })[KeyManager.id];


    // loop in list of sura in one page
for (var suraPage in pageDetails) {
  //loop in list of all juz
  for (var e in juz) {
    // list of sura number
    surNum = e[KeyManager.surahs];

    // loop in list of sura number in juz
    for (var num in surNum) {
      if (e[KeyManager.verses][num][0] <= suraPage[KeyManager.start] &&
          e[KeyManager.verses][num][1] >= suraPage[KeyManager.end]) {
        // juzData.clear();
        juzData.add(e);
      }
    }
  }
}
    return JuzPageModel(
        juzNum: juzData[0][KeyManager.id],
        suraNum: pageDetails[0][KeyManager.surah],
        suraName: surah[pageDetails[0][KeyManager.surah] - 1]
        [KeyManager.arabic]);


    }

    // // loop in list of sura in one page
// for (var suraPage in pageDetails) {
//   //loop in list of all juz
//   for (var e in juz) {
//     // list of sura number
//     surNum = e[KeyManager.surahs];
//
//     // loop in list of sura number in juz
//     for (var num in surNum) {
//       if (e[KeyManager.verses][num][0] <= suraPage[KeyManager.start] &&
//           e[KeyManager.verses][num][1] >= suraPage[KeyManager.end]) {
//         juzData.add(e);
//       }
//     }
//   }
// }
// loop in list of sura in one page// for (var suraPage in pageDetails) {
//   //loop in list of all juz
//   for (var e in juz) {
// list of sura number
// surNum = e[KeyManager.surahs];
// loop in list of sura number in juz
// for (var num in surNum) {
//   if (e[KeyManager.verses][num][0] <= suraPage[KeyManager.start] &&
//       e[KeyManager.verses][num][1] >= suraPage[KeyManager.end]) {
//     juzData.add(e);
//   }
// }
// }
  }

// getJuzPageDetails(int page) {
//   List<Map> pageDetails = pageData[page - 1];
//   List<Map> surahData = [];
//   juz.where(test)
//   return JuzPageModel(juzNum: juzNum, suraNum: suraNum, suraName: suraName)
// }
// }

// Map pageDetails = pageData[page - 1][0];
// Map surahData = surah.firstWhere((value) {
//   return value[KeyManager.id] == pageDetails[KeyManager.surah];
// });
// Map juzDetails= juz.firstWhere((e) {
//   return e[KeyManager.surahs][0] == surahData[KeyManager.id] &&
//       e[KeyManager.verses][surahData[KeyManager.id]][0] <=
//           pageDetails[KeyManager.start] &&
//       e[KeyManager.verses][surahData[KeyManager.id]][1] >=
//           pageDetails[KeyManager.end];
// });
