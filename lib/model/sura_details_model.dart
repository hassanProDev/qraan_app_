import 'package:quran_app/core/json_key.dart';
import 'package:quran_app/util/quran_package/quran.dart';

class SuraDetailsModel {
  int number;
  String name;
  String englishName;
  String englishNameTranslation;
  int numberOfAyahs;
  String revelationType;
  String suraPlaceOfRevelation;
  int pageNumber;

  SuraDetailsModel({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.numberOfAyahs,
    required this.revelationType,
    required this.pageNumber,
    required this.suraPlaceOfRevelation,
  });

  SuraDetailsModel.fromJson(Map json)
      : this(
          number: json[KeyManager.number],
          name: json[KeyManager.name],
          englishName: json[KeyManager.englishName],
          englishNameTranslation: json[KeyManager.englishNameTranslation],
          numberOfAyahs: json[KeyManager.numberOfAyahs],
          revelationType: json[KeyManager.revelationType],
          pageNumber: json[KeyManager.pageNumber],
          suraPlaceOfRevelation: getPlaceOfRevelation(json[KeyManager.number]),
        );

  SuraDetailsModel.fromPage(Map json):this(
    number: json[KeyManager.number],
    name: json[KeyManager.name],
    englishName: json[KeyManager.englishName],
    englishNameTranslation: json[KeyManager.englishNameTranslation],
    numberOfAyahs: json[KeyManager.numberOfAyahs],
    revelationType: json[KeyManager.revelationType],
    pageNumber: json[KeyManager.pageNumber],
    suraPlaceOfRevelation: getPlaceOfRevelation(json[KeyManager.number]),
  );
}
