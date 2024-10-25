import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:quran_app/model/sura_details_model.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranInitial());

  List<SuraDetailsModel> widgetJsonData=[];

  loadJsonAsset() async {
    try {
      final String jsonString =
      await rootBundle.loadString('assets/json/surahs.json');
      List<dynamic> data = jsonDecode(jsonString);
      widgetJsonData = List<Map>.from(data).map((e)=>SuraDetailsModel.fromJson(e)).toList();
      emit(SuraJsonSuccess());
    } on Exception catch (e) {
      emit(SuraJsonField());
    }
  }

  int pageNumber=1;
  savePageNum(int page){
    pageNumber=page;
    emit(SavePageNum());
  }
}
