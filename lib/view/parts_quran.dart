import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/json_key.dart';
import 'package:quran_app/logic/quran/quran_cubit.dart';
import 'package:quran_app/model/sura_details_model.dart';
import 'package:quran_app/util/quran_package/juz_data.dart';
import 'package:quran_app/util/quran_package/quran.dart';
import 'package:quran_app/view/quran_page.dart';

class PartsQuran extends StatelessWidget {
  const PartsQuran({super.key});

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
              trailing: Text("الصفحة"),
              title: Text("الجزء"),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: juz.length,
                itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => QuranPage(
                          pageNumber: getPageNumber(
                              juz[index][KeyManager.surahs][0],
                              juz[index][KeyManager.verses]
                                  [juz[index][KeyManager.surahs][0]][0]),
                        ),
                      ),
                    );
                  },
                  leading: Text(juz[index][KeyManager.id].toString()),
                  title: Text(juzText[juz[index][KeyManager.id] - 1]),
                  trailing: Text(getPageNumber(
                          juz[index][KeyManager.surahs][0],
                          juz[index][KeyManager.verses]
                              [juz[index][KeyManager.surahs][0]][0])
                      .toString()),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
