import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardSurah extends StatelessWidget {
  CardSurah(
      {this.id,
      this.name,
      this.arab,
      this.translate,
      this.countAyat,
      this.onTap});
  final int id;
  final String name;
  final String arab;
  final String translate;
  final int countAyat;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        child: Container(
          child: Column(
            children: <Widget>[
              ListTile(
                onTap: onTap,
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(name),
                ),
                subtitle: Text(translate),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text("Surat Ke"),
                        Text("$id"),
                        Text("Ayat"),
                        Text("$countAyat"),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text("Arabic"),
                        Text(arab),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
