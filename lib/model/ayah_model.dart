import 'package:quran_app/core/json_key.dart';

class AyahModel {
  int suraNumber;
  int ayahNumber;
  String content;

  AyahModel({
    required this.suraNumber,
    required this.ayahNumber,
    required this.content,
  });

  AyahModel.fromJson(Map json)
      : this(
          suraNumber: json[KeyManager.surah_number],
          ayahNumber: json[KeyManager.verse_number],
          content: json[KeyManager.content],
        );
}
