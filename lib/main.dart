import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quran_app/logic/quran/quran_cubit.dart';
import 'package:quran_app/util/helper_method.dart';
import 'package:quran_app/view/home.dart';

void main() {
  print(getContentPage(3));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<QuranCubit>(create: (_)=>QuranCubit())
      ],
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              Color(0xff017a0b),
              Color(0xff013a05),
            ],
          ),
        ),
        child: const
        SafeArea(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Quran',
            home: HomePage(),
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('en'), // English
              Locale('ar'), // arabic
            ],
            locale: Locale("ar"),
          ),
        ),
      ),
    );
  }
}
