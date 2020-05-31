import 'package:flutter/material.dart';
import 'package:pk_skeleton/pk_skeleton.dart';
import 'package:quran_digital/models/alldoa.dart';
import 'package:quran_digital/ui/widget/carddoa.dart';
import 'package:quran_digital/utils/services.dart';

class ListDoa extends StatefulWidget {
  @override
  _ListDoaState createState() => _ListDoaState();
}

class _ListDoaState extends State<ListDoa> {
  Services apiService;
  final Color bgcolor = Color(0xffF3F3F3);
  final Color primer = Color(0xffe70f0B);
  @override
  //memanggil api servis agar bisa melakukan insert data
  void initState() {
    super.initState();
    apiService = Services();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgcolor,
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: Text("Doa Harian"),
        ),
        body: FutureBuilder<List<AllDoa>>(
          future: Services().getDoa(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView(
                    children: snapshot.data
                        .map((data) => CardDoa(
                              title: data.title,
                              arabic: data.arabic,
                              translate: data.translation,
                              latin: data.latin,
                            ))
                        .toList())
                : PKCardListSkeleton(
                    isCircularImage: true,
                    isBottomLinesActive: true,
                    length: 10,
                  );
          },
        ));
  }
}
