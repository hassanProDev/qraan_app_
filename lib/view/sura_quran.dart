import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/logic/quran/quran_cubit.dart';
import 'package:quran_app/util/quran_package/quran.dart';
import 'package:quran_app/view/quran_page.dart';

class SuraQuran extends StatelessWidget {
  SuraQuran({super.key});

  @override
  Widget build(BuildContext context) {
    final myCubit = BlocProvider.of<QuranCubit>(context);
    return BlocBuilder<QuranCubit, QuranState>(
      builder: (context, state) {
        myCubit.loadJsonAsset();
        return Column(
          children: [
            ListTile(
              leading: Text("الرقم"),
              title: Text("السورة"),
              trailing: Text("الصفحة"),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: myCubit.widgetJsonData.length,
                itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    print(getPageNumber(
                        myCubit.widgetJsonData[index].number, 1));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => QuranPage(
                          pageNumber: getPageNumber(
                              myCubit.widgetJsonData[index].number, 1),
                        ),
                      ),
                    );
                  },
                  leading: Text(
                    myCubit.widgetJsonData[index].number.toString(),
                  ),
                  trailing: Text(
                    myCubit.widgetJsonData[index].pageNumber.toString(),
                  ),
                  title: Text(
                    myCubit.widgetJsonData[index].name,
                  ),
                  subtitle: Text(
                      "${myCubit.widgetJsonData[index].suraPlaceOfRevelation} | ${myCubit.widgetJsonData[index].numberOfAyahs} اية"),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
