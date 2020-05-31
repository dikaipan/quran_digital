import 'dart:core';
import 'package:flutter/material.dart';
import 'package:pk_skeleton/pk_skeleton.dart';
import 'package:quran_digital/models/suratinfo.dart';
import 'package:quran_digital/ui/detailayat.dart';
import 'package:quran_digital/ui/widget/SlimiCardSurah.dart';

import 'package:quran_digital/utils/services.dart';

class ListAlquran extends StatefulWidget {
  @override
  _ListAlquranState createState() => _ListAlquranState();
}

///Kode untuk memanggil service

//Menampilkan list data adalah pola dasar untuk aplikasi seluler. Flutter termasuk widget ListView untuk membuat bekerja dengan daftar menjadi mudah.
//karna file yang akan di di get merupakan kumpulan antara integer dan string maka kita mapping dahulu dengan menggunakan dynamic
//karna key di Json nya adalah data maka saya ambil 'data' tersebut dan memapping nya agar bisa mengambil field yang dibutuhkan
class _ListAlquranState extends State<ListAlquran> {
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
          title: Text("Al-Qur'an"),
        ),
        body: FutureBuilder<List<SuratInfo>>(
          future: Services().getSurah(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView(
                    children: snapshot.data
                        .map((data) => SlimCardSurah(
                              arti: data.arti,
                              asma: data.asma,
                              nama: data.nama,
                              rukuk: data.rukuk,
                              keterangan: data.keterangan,
                              ayat: data.ayat.toString(),
                              surah: data.index.toString(),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailAyat(
                                              detail: data.nama,
                                              index: data.index,

                                              // onTap: () {},
                                            )));
                              },
                            ))
                        .toList())
                : PKCardListSkeleton(
                    isCircularImage: true,
                    isBottomLinesActive: true,
                    length: 10,
                  );
          },
        ));
    // return Scaffold(
    //   backgroundColor: bgcolor,
    //   appBar: AppBar(
    //     backgroundColor: primer,
    //     flexibleSpace: FlexibleSpaceBar(
    //       collapseMode: CollapseMode.parallax,
    //       centerTitle: true,
    //       title: Text("Al-Qur'an Digital"),
    //     ),
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.only(top: 20),
    //     child: FutureBuilder<List<SuratInfo>>(
    //       //untuk meminta data dari fungsi getInfo()
    //       future: apiService.getSurah(),
    //       //kemudian membuilf data ketika diminta oleh user
    //       //data yang didapat kemudian dimasukan ke snapshot
    //       builder: ( context,  snapshot) {
    //         //jika data dari snapsot error maka menampilkan Card dari gambar Error
    //         if (snapshot.hasError) {
    //           return Center(
    //             child: Card(
    //               margin: EdgeInsets.all(20),
    //               elevation: 15,
    //               child: Image.asset(
    //                 "images/error.jpg",
    //                 fit: BoxFit.cover,
    //               ),
    //             ),
    //           );
    //           //jika koneksi datanya berhasil dan selesai
    //         } else if (snapshot.connectionState == ConnectionState.done) {
    //           //maka akan mengembalikan nilai yaitu membuat listView Builder
    //           //listview builder digunakan untuk menampilkan data yang sudah berhasil diambil kedalam bentuk List Widget
    //           return ListView.builder(
    //             //item dari data yang akan di tamilkan , artinya seluruh data dari snapshot akan di buld ke list
    //             itemCount: snapshot.data.length,
    //             //index digunakan untuk mengakses data dari snapshot.data[index] kemudian di ikuti data yang ingin diambil ex .id
    //             itemBuilder: (BuildContext context, int index) {

    //               //memasukan data snapshot untuk di insert ke card surah yang sudah dibuat
    //               return Padding(
    //                 padding: const EdgeInsets.only(bottom: 10),
    //                 child: snapshot.data.map((data)=> CardSurah(
    //                   index: snapshot.data[index].index.toString(),
    //                   asma: snapshot.data[index].asma,
    //                   nama: snapshot.data[index].name,
    //                   arti: snapshot.data[index].arti,
    //                   ayat: snapshot.data[index].ayat,
    //                   onTap: () {
    //                     Navigator.push(
    //                         context,
    //                         MaterialPageRoute(
    //                             builder: (context) => DetailAyat(
    //                                   detail: snapshot.data[index].englishName,
    //                                   index: snapshot.data[index].number,
    //                                 )));
    //                   },
    //                 ),
    //               );
    //             },)

    //           );
    //           //jika pengambilan data masih dilakukan maka
    //         } else {
    //           //mengembalikan  pkcardskeleton yaitu sebuah package untuk membuat card seakan2 sedang di load
    //           return PKCardListSkeleton(
    //             isCircularImage: false,
    //             isBottomLinesActive: true,
    //             length: 10,
    //           );
    //         }
    //       },
    //     ),
    //   ),
    // );
  }
}
