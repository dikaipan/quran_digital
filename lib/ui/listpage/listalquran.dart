import 'package:flutter/material.dart';
import 'package:pk_skeleton/pk_skeleton.dart';
import 'package:quran_digital/models/alquran.dart';
import 'package:quran_digital/ui/widget/cardsurah.dart';

class ListAlquran extends StatefulWidget {
  @override
  _ListAlquranState createState() => _ListAlquranState();
}

class _ListAlquranState extends State<ListAlquran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Quran")),
    );
  }
}
