import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quran_digital/ui/home.dart';
import 'package:slimy_card/slimy_card.dart';

class SlimCardSurah extends StatefulWidget {
  final String surah;
  final String asma;
  final String nama;
  final String arti;
  final String rukuk;
  final String ayat;
  final String keterangan;
  final VoidCallback onTap;
  //todo 1.membuat Konstruktor dari kelas tersebut ,yang mana berguna untuk menerima atau memasukan value data dari Json File atupun API
  SlimCardSurah(
      {@required this.surah,
      this.asma,
      this.nama,
      this.arti,
      this.rukuk,
      this.ayat,
      this.keterangan,
      this.onTap});
  //todo 2.menginisialisasi tipe data agar bisa melakukan pengambilan data dari file Json yang dituju

  @override
  _SlimCardSurahState createState() => _SlimCardSurahState();
}

@override
class _SlimCardSurahState extends State<SlimCardSurah> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 15),
        child: SlimyCard(
          color: Colors.green,
          borderRadius: 15,
          width: 440.0,
          topCardHeight: 230.0,
          topCardWidget: Container(
            padding: EdgeInsets.only(bottom: 20.0),
            color: Colors.transparent,
            //widget inkwell digunakan agar ketika card di tekan dia dapat mentrigger event
            child: Column(
              children: <Widget>[
                //menggunakan widget list tile untuk menampilkan info surah agar lebih tertata
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    onTap: widget.onTap,
                    title: Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: Center(
                        child: Text(
                          widget.nama,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: Center(
                        child: Text(
                          widget.arti,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    trailing: Icon(
                      FontAwesomeIcons.arrowCircleRight,
                      color: Colors.white,
                    ),
                  ),
                ),

                Divider(
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                  color: Colors.white,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text("Surat Ke",
                              style: TextStyle(color: Colors.white)),
                          Divider(),
                          Text(widget.surah,
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text("Ayat", style: TextStyle(color: Colors.white)),
                          Divider(),
                          Text(widget.ayat,
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text("Asma", style: TextStyle(color: Colors.white)),
                          Divider(),
                          Text(widget.asma,
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text("Rukuk", style: TextStyle(color: Colors.white)),
                          Divider(),
                          Text(widget.rukuk,
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          bottomCardHeight: 200,

          // bottomCardWidget: ,
          slimeEnabled: true,
          bottomCardWidget: SingleChildScrollView(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 10,
              //widget inkwell digunakan agar ketika card di tekan dia dapat mentrigger event
              child: InkWell(
                customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                splashColor: Colors.white10,
                onTap: widget.onTap,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      //menggunakan widget list tile untuk menampilkan info surah agar lebih tertata
                      ListTile(
                        contentPadding: EdgeInsets.all(10.0),
                        title: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                              child: Center(
                            child: Text("Keterangan",
                                style: TextStyle(fontSize: 20)),
                          )),
                        ),
                      ),

                      Divider(
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              widget.keterangan,
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
