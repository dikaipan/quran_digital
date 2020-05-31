import 'package:flutter/material.dart';
import 'package:pk_skeleton/pk_skeleton.dart';
import 'package:quran_digital/models/allasmaul.dart';
import 'package:quran_digital/ui/widget/cardasmaul.dart';
import 'package:quran_digital/utils/services.dart';

class ListAsmaul extends StatefulWidget {
  @override
  _ListAsmaulState createState() => _ListAsmaulState();
}

class _ListAsmaulState extends State<ListAsmaul> {
  Services apiService;
  final Color bgcolor = Color(0xffF3F3F3);

  @override
  //memanggil api servis agar bisa melakukan insert data
  void initState() {
    super.initState();
    apiService = Services();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgcolor,
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: Text("Asma'ul Husna"),
        ),
        body: FutureBuilder<List<AllAsmaul>>(
          future: Services().getAsmaul(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? Directionality(
                    textDirection: TextDirection.rtl,
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      children: snapshot.data
                          .map((asm) => new CardAsmaul(
                                arabic: asm.arabic,
                                title: asm.latin,
                                translate: asm.translationId,
                              ))
                          .toList(),
                    ))
                : PKCardPageSkeleton(
                    totalLines: 5,
                  );
          },
        ));
  }
}
