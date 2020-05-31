import 'dart:ui';

import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//Membuat card yang nantinya digunakan oleh data array objek yang sudah di Get

class CardDoa extends StatelessWidget {
  //todo 1.menginisialisasi tipe data agar bisa melakukan pengambilan data dari file Json yang dituju
  final String title;
  final String arabic;
  final String latin;
  final String translate;
//todo 2.membuat Konstruktor dari kelas tersebut ,yang mana berguna untuk menerima atau memasukan value data dari Json File atupun API
  CardDoa({
    this.title,
    this.arabic,
    this.latin,
    this.translate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.2, 10, 0.2, 0),
      child: Card(
        color: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 0.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24.0, color: Colors.white),
                ),
              ),
              Divider(
                thickness: 1,
                indent: 15,
                endIndent: 15,
                color: Colors.white,
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  arabic,
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 25.0, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  latin,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              //garis batas antara latin dan translate
              Divider(
                thickness: 1,
                indent: 10,
                endIndent: 10,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ExpandablePanel(
                  iconColor: Colors.white,
                  header: Text("Terjemahan",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                  expanded: Text(translate,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      softWrap: true,
                      textAlign: TextAlign.justify),
                ),
              ),
              // Text(
              //   translate,
              //   textAlign: TextAlign.center,
              //   style: TextStyle(fontSize: 15, color: Colors.white),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
