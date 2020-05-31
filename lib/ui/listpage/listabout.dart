import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListAbout extends StatefulWidget {
  @override
  _ListAboutState createState() => _ListAboutState();
}

class _ListAboutState extends State<ListAbout> {
  final Color bgcolor = Color(0xffF3F3F3);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("About"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.asset("images/mekkah2.jpg")),
            Container(
              margin: EdgeInsets.fromLTRB(16.0, 200.0, 16.0, 16.0),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(16.0),
                        margin: EdgeInsets.only(top: 16.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 150.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Al-Qur'an Digital App",
                                    style: Theme.of(context).textTheme.title,
                                  ),
                                  ListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    title: Text("@dikaipan"),
                                    subtitle: Text(
                                      "Made With ❤️ In Jogja",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.0),
                          ],
                        ),
                      ),
                      Container(
                        height: 130,
                        width: 150,
                        padding: EdgeInsets.all(10),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0)),
                              child: Image.asset(
                                "images/profile.jpg",
                                fit: BoxFit.contain,
                              )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text("My information"),
                        ),
                        Divider(),
                        ListTile(
                          title: Text("Email"),
                          subtitle: Text("handikajuliansyah.hj@gmail.com"),
                          leading: Icon(FontAwesomeIcons.mailBulk),
                        ),
                        ListTile(
                          title: Text("Github"),
                          subtitle: Text("https://github.com/dikaipan"),
                          leading: Icon(FontAwesomeIcons.git),
                        ),
                        ListTile(
                          title: Text("Twitter"),
                          subtitle: Text("@dikaipan"),
                          leading: Icon(FontAwesomeIcons.twitterSquare),
                        ),
                        ListTile(
                          title: Text("My Website"),
                          subtitle: Text("https://www.hallodikaipan.web.app/"),
                          leading: Icon(Icons.web),
                        ),
                        ListTile(
                          title: Text("About"),
                          subtitle: Text(
                              "Aplikasi Al-Qur'an Digital ini merupakan hasil akhir dari tugas akhir yang saya ambil untuk menyelesaikan Study saya , ada beberapa fitur didalamnya dari Al-Qur'an ,Tafsir dari Kemenag , Translate , Asma'ul Husna Dan Doa Harian , Aplikasi ini dibangun menggunakan Framework Flutter dan dengan menggunakan bahasa Pemrograman Dart 🎯"),
                          leading: Icon(FontAwesomeIcons.infoCircle),
                        ),
                        ListTile(
                          title: Text("Created At"),
                          subtitle: Text("2020"),
                          leading: Icon(FontAwesomeIcons.calendarAlt),
                        ),
                        ListTile(
                          title: Text("Made With Flutter 💙"),
                          leading: Icon(FontAwesomeIcons.signature),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
