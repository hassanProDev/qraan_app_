part of 'quran_cubit.dart';

@immutable
abstract class QuranState {}

class QuranInitial extends QuranState {}
class SuraJsonSuccess extends QuranState {}
class SuraJsonField extends QuranState {}
class SavePageNum extends QuranState {}

