import 'dart:core';

import 'package:flutter/material.dart';
import 'package:pk_skeleton/pk_skeleton.dart';
import 'package:quran_digital/models/surah_info.dart';
import 'package:quran_digital/ui/widget/cardsurah.dart';
import 'package:quran_digital/utils/api_services.dart';

class ListAlquran extends StatefulWidget {
  @override
  _ListAlquranState createState() => _ListAlquranState();
}

///Kode untuk memanggil service

class _ListAlquranState extends State<ListAlquran> {
  Services apiService;
  final Color bgcolor = Color(0xffF3F3F3);
  final Color primer = Color(0xffe70f0B);

  @override
  void initState() {
    super.initState();
    apiService = Services();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        title: Text("Quran"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: FutureBuilder(
          future: apiService.getInfo(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Card(
                  margin: EdgeInsets.all(20),
                  elevation: 15,
                  child: Image.asset(
                    "images/error.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: CardSurah(
                      id: snapshot.data[index].id,
                      name: snapshot.data[index].name,
                      arab: snapshot.data[index].arab,
                      translate: snapshot.data[index].translate,
                      countAyat: snapshot.data[index].countAyat,
                    ),
                  );
                },
              );
            } else {
              return PKCardListSkeleton(
                isCircularImage: false,
                isBottomLinesActive: true,
                length: 10,
              );
            }
          },
        ),
      ),
    );
  }
}
