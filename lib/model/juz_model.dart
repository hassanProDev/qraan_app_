import 'package:quran_app/core/json_key.dart';

class JuzModel {
  int juzNumber;
  int juzPage;
  int name;

  JuzModel(
      {required this.juzNumber, required this.juzPage, required this.name});

  JuzModel.fromJson(Map json)
      : this(
          juzNumber: json[KeyManager.id],
          juzPage: 1,
          name: 1,
        );
}
