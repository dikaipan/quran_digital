//*package material adalah package yang menghandel tampilan aplikasi iOS
import 'package:flutter/cupertino.dart';
//*package material adalah package yang menghandel tampilan aplikasi android
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quran_digital/ui/listpage/listalquran.dart';
import 'package:quran_digital/ui/listpage/listasmaul.dart';
import 'package:quran_digital/ui/listpage/listabout.dart';
import 'package:quran_digital/ui/listpage/listdoa.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

//Membuat variable  warna yang akan digunakan Bottom Navigation Bar
final Color bgColor = Color(0xffF3F3F3);
final Color primerColor = Color(0xFF808080);
final Color primerAccentColor = Colors.green;

class _HomeState extends State<Home> {
// variable untuk inisialisasi tabbar yang sedang digunakan
  int _currenTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    //*Controller Bottom Navigation Bar

    final _kTabPages = <Widget>[
      ListAlquran(),
      ListAsmaul(),
      ListDoa(),
      ListAbout()
    ];

    //*_kBotomNavigasiItem  mengembalikan Widget List dari bar item

    final _kBotomNavigasiItem = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          //*Memberikan Event ubah icon ketika user menekan
          activeIcon: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Icon(
              FontAwesomeIcons.solidCircle,
              size: 8.0,
            ),
          ),
          icon: Icon(
            FontAwesomeIcons.quran,
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text("Al-Qur'an"),
          )),
      BottomNavigationBarItem(
        activeIcon: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Icon(
            FontAwesomeIcons.solidCircle,
            size: 8.0,
          ),
        ),
        icon: Icon(FontAwesomeIcons.list),
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text("Asma'ul Husna"),
        ),
      ),
      BottomNavigationBarItem(
        activeIcon: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Icon(
            FontAwesomeIcons.solidCircle,
            size: 8.0,
          ),
        ),
        icon: Icon(FontAwesomeIcons.book),
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text("Doa Harian"),
        ),
      ),
      BottomNavigationBarItem(
        activeIcon: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Icon(
            FontAwesomeIcons.solidCircle,
            size: 8.0,
          ),
        ),
        icon: Icon(FontAwesomeIcons.infoCircle),
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text("About"),
        ),
      ),
    ];
    /* 
    *class yang berguna menampung item bottom navigation bar
    *dimana widget ini yang digunakan untuk membuat bottom navigation bar
    */
    final bottomNavBar = BottomNavigationBar(
      elevation: 0,
      backgroundColor: bgColor,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey.shade700,
      //*menginisialisai items dengan value _kBottomNavigationItem
      items: _kBotomNavigasiItem,
      //*current indeks adalah value index yang manakah yang sedang digunakan saat ini
      currentIndex: _currenTabIndex,
      type: BottomNavigationBarType.fixed,
      //*Memberi Event on tap di tabbar bar item yang dibuat
      onTap: (int index) {
        //*saya meng set sebuah state dimana nantinya funsi ini yang akan memberitahu Bottom Navigation Item mana yang aktif
        setState(() {
          _currenTabIndex = index;
        });
      },
    );
    //*mereturn widget Scafold
    return Scaffold(
      backgroundColor: bgColor,
      //*kontroller dimana kontroller itu yang mereturn tampilan di body
      body: _kTabPages[_currenTabIndex],
      //*menginisialisasi bottom navigation bar  dengan bottomNavBar
      bottomNavigationBar: bottomNavBar,
    );
  }
}
