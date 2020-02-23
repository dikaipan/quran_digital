import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quran_digital/ui/listpage/listalquran.dart';
import 'package:quran_digital/ui/listpage/listasmaul.dart';
import 'package:quran_digital/ui/listpage/listceramah.dart';
import 'package:quran_digital/ui/listpage/listdoa.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

final Color bgcolor = Color(0xffF3F3F3);
final Color primer = Color(0xffe70f0B);

class _HomeState extends State<Home> {
  int _currenTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      ListAlquran(),
      ListAsmaul(),
      ListDoa(),
      ListCeramah()
    ];

    final _kBotomNavigasiItem = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
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
        icon: Icon(FontAwesomeIcons.youtube),
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text("Ceramah"),
        ),
      ),
    ];

    final bottomNavBar = BottomNavigationBar(
      elevation: 0,
      backgroundColor: bgcolor,
      selectedItemColor: primer,
      unselectedItemColor: Colors.grey.shade700,
      items: _kBotomNavigasiItem,
      currentIndex: _currenTabIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currenTabIndex = index;
        });
      },
    );

    return Scaffold(
      backgroundColor: bgcolor,
      body: _kTabPages[_currenTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
