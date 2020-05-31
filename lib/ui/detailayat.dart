import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:pk_skeleton/pk_skeleton.dart';
import 'package:quran_digital/models/allayat.dart';

import 'package:quran_digital/utils/services.dart';

class DetailAyat extends StatefulWidget {
  final detail, index;
  DetailAyat({@required this.detail, this.index});

  @override
  _DetailAyatState createState() => _DetailAyatState();
}

class _DetailAyatState extends State<DetailAyat> {
  Services apiService;
  final Color bgColor = Color(0xffF3F3F3);
  final Color primerColor = Color(0xFF808080);
  final Color primerAccentColor = Colors.purple;
  @override
  //memanggil api servis agar bisa melakukan insert data
  void initState() {
    super.initState();
    apiService = Services();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.detail),
      ),
      body: FutureBuilder<AllAyat>(
          future: Services().loadAyat(widget.index),
          builder: (context, snapshot) {
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
              //membuat sebuah list view dari data surah yang akan ditampilkasn
              return ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                //item yang akan dipanggil
                itemCount: snapshot.data.text.length,
                itemBuilder: (BuildContext c, int i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          leading: Card(
                              color: Colors.green,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              child: Container(
                                  height: 30,
                                  width: 30,
                                  child: Center(
                                    child: Text(
                                      snapshot.data.text.keys.elementAt(i),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ))),
                          title: Text(snapshot.data.text.values.elementAt(i),
                              textAlign: TextAlign.end,
                              style: TextStyle(fontSize: 25)),
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 5.0),
                          child: ExpandablePanel(
                            header: Card(
                              color: Colors.green,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0)),
                              child: Container(
                                height: 30,
                                child: Center(
                                  child: Text("Terjemahan",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white)),
                                ),
                              ),
                            ),
                            expanded: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  snapshot.data.translations.id.text.values
                                      .elementAt(i),
                                  softWrap: true,
                                  textAlign: TextAlign.justify),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 5.0),
                          child: ExpandablePanel(
                            header: Card(
                              color: Colors.green,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0)),
                              child: Container(
                                height: 30,
                                child: Center(
                                  child: Text("Tafsir",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white)),
                                ),
                              ),
                            ),
                            expanded: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  snapshot.data.tafsir.id.kemenag.text.values
                                      .elementAt(i),
                                  softWrap: true,
                                  textAlign: TextAlign.justify),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return PKCardListSkeleton(
                isCircularImage: false,
                isBottomLinesActive: true,
                length: 1,
              );
            }
          }),
    );
  }
}
