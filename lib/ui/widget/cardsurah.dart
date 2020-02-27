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
  final String id;
  final String name;
  final String arab;
  final String translate;
  final String countAyat;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        elevation: 10,
        child: InkWell(
          splashColor: Colors.red,
          onTap: () {},
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Column(
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.all(10),
                  onTap: onTap,
                  title: Center(child: Text(name)),
                  subtitle: Center(child: Text(translate)),
                ),
                Divider(
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text("Surat Ke"),
                          Text("$id"),
                        ],
                      ),
                      Column(
                        children: <Widget>[
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
      ),
    );
  }
}
