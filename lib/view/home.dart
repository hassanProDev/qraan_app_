import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/logic/quran/quran_cubit.dart';
import 'package:quran_app/view/parts_quran.dart';
import 'package:quran_app/view/quran_page.dart';
import 'package:quran_app/view/sura_quran.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xfff4f3ed),
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  Color(0xff017a0b),
                  Color(0xff013a05),
                ],
              ),
            ),
          ),
          title: const Text(
            'القران الكريم',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => QuranPage(
                        pageNumber:
                            BlocProvider.of<QuranCubit>(context).pageNumber),
                  ),
                );
              },
              icon: Icon(
                CupertinoIcons.book,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Container(
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
              child: TabBar(
                padding: EdgeInsets.all(0.0),
                labelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle: TextStyle(height: 3, fontSize: 18),
                unselectedLabelColor: Colors.white,
                indicatorColor: Colors.yellow,
                tabs: [
                  Align(child: Text("سورة")),
                  Align(child: Text("جزء")),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SuraQuran(),
                  PartsQuran(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
