import 'package:quran_app/core/json_key.dart';
import 'package:quran_app/util/quran_package/page_data.dart';
import 'package:quran_app/util/quran_package/quran_text.dart';

class SuraPageModel {
  int suraNumber;
  int startAyahInPage;
  int endAyahInPage;
  int juzNum;

  SuraPageModel({
    required this.startAyahInPage,
    required this.endAyahInPage,
    required this.suraNumber,
    required this.juzNum,
  });

  SuraPageModel.fromList(Map json)
      : this(
          suraNumber: json[KeyManager.surah],
          startAyahInPage: json[KeyManager.start],
          endAyahInPage: json[KeyManager.end],
          juzNum: json[KeyManager.juzNum],
        );
}
