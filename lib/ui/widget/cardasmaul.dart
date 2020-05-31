import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//Membuat card yang nantinya digunakan oleh data array objek yang sudah di Get

class CardAsmaul extends StatelessWidget {
  //todo 1.menginisialisasi tipe data agar bisa melakukan pengambilan data dari file Json yang dituju
  final String title;
  final String arabic;
  final String translate;
  final String translateIng;
//todo 2.membuat Konstruktor dari kelas tersebut ,yang mana berguna untuk menerima atau memasukan value data dari Json File atupun API
  CardAsmaul({this.title, this.arabic, this.translate, this.translateIng});

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
              Text(
                arabic,
                style: TextStyle(fontSize: 30.0, color: Colors.white),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                translate,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
