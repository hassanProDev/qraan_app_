import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/json_key.dart';
import 'package:quran_app/logic/quran/quran_cubit.dart';
import 'package:quran_app/model/juz_page_model.dart';
import 'package:quran_app/model/sura_details_model.dart';
import 'package:quran_app/util/helper_method.dart';
import 'package:quran_app/util/quran_package/page_data.dart';
import 'package:quran_app/util/quran_package/quran.dart';
import 'package:quran_app/view/widget/ayahNumber.dart';
import 'package:quran_app/view/widget/basmallah.dart';
import 'package:quran_app/view/widget/header_widget.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class QuranPage extends StatefulWidget {
  QuranPage({super.key, required this.pageNumber,});

  int pageNumber;

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  List<GlobalKey> richTextKeys = List.generate(604, (_) => GlobalKey());

  setIndex() {
    setState(() {
      index = widget.pageNumber;
    });
  }

  int index = 0;
  late PageController pageController;
  late Timer timer;
  String selectedSpan = "";

  @override
  void initState() {
    setIndex();
    pageController = PageController(initialPage: index);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    WakelockPlus.enable();
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    WakelockPlus.disable();
    super.dispose();
  }
bool isVisible=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.horizontal,
          onPageChanged: (a) {
            setState(() {});
            index = a;
          },
          controller: pageController,
          itemCount: totalPagesCount + 1,
          itemBuilder: (_, index) {
            // bool isEvenPage = index.isEven;

            if (index == 0) {
              return Container(
                padding: EdgeInsets.all(16),
                color: const Color(0xffFFFCE7),
                child: Image.asset(
                  "assets/images/qlogo.png",
                  // fit: BoxFit.fill,
                ),
              );
            }
            final screenSize = MediaQuery.of(context).size;
            return Stack(
              children: [
                InkWell(
                  onTap: (){
                    isVisible=!isVisible;
                    setState(() {

                    });
                  },
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: Scaffold(
                      resizeToAvoidBottomInset: false,
                      backgroundColor: Color(0xfff4f3ed),
                      body: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12.0, left: 12),
                          child: SingleChildScrollView(
                            physics: const ClampingScrollPhysics(),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          " الجزء |${pageData[index][0][KeyManager.juzNum]}"),
                                      Text(
                                          " سورة ${JuzPageModel.fromPageNum(index).suraName}"),
                                    ],
                                  ),
                                ),
                                if ((index == 1 || index == 2))
                                  SizedBox(
                                    height: (screenSize.height * .15),
                                  ),
                                // const SizedBox(
                                //   height: 6,
                                // ),
                                Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: RichText(
                                      // key: richTextKeys[index-1],
                                      softWrap: true,
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        children:
                                            getContentPage(index).expand((e) {
                                          List<InlineSpan> spans = [];
                                          if (e.ayahNumber == 1) {
                                            spans.add(WidgetSpan(
                                              child: HeaderWidget(
                                                e: e,
                                              ),
                                            ));
                                            if (index != 187 && index != 1) {
                                              spans.add(WidgetSpan(
                                                child: Basmallah(index: 0),
                                              ));
                                            }
                                            if (index == 187) {
                                              spans.add(WidgetSpan(
                                                child: Container(
                                                  height: 10,
                                                ),
                                              ));
                                            }
                                          }
                                          spans.add(
                                            TextSpan(
                                              style: TextStyle(
                                                color: Colors.black,
                                                // height: (index == 1 || index == 2)
                                                //     ? 20
                                                //     : 12,
                                                letterSpacing: 0,
                                                wordSpacing: 0,
                                                fontFamily:
                                                    "QCF_P${index.toString().padLeft(3, "0")}",
                                                fontSize: index == 1 || index == 2
                                                    ? 28
                                                    : index == 145 || index == 201
                                                        ? index == 532 ||
                                                                index == 533
                                                            ? 22.5
                                                            : 22.4
                                                        : 23.1,
                                                backgroundColor:
                                                    Colors.transparent,
                                              ),
                                              text: e.content,
                                            ),
                                          );
                                          spans.add(WidgetSpan(
                                              child: AyahNumber(
                                                  number: e.ayahNumber)));
                                          return spans;
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(index.toString()),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isVisible,
                  child: Container(
                    decoration: BoxDecoration(color: Color(0x88656565)),
                    child: ListTile(
                      tileColor: WidgetStateColor.transparent,
                     subtitle : Text(
                          " الجزء |${pageData[index][0][KeyManager.juzNum]}"),
                      title: Text(
                          " سورة ${JuzPageModel.fromPageNum(index).suraName}"),
                      trailing: IconButton(
                        onPressed: () {
                          BlocProvider.of<QuranCubit>(context).savePageNum(index);
                          isVisible=false;
                          setState(() {

                          });
                        },
                        icon: Icon(
                          Icons.bookmark_outline_sharp,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
