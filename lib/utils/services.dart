//Paket ini berisi encoders dan decoder untuk mengkonversi antara representasi data yang berbeda. Ini adalah mitra eksternal panah: konversi pustaka inti, dan mengandung API dan API yang kurang sentral yang membutuhkan versi yang lebih fleksibel.

//Paket dart http ini berisi serangkaian fungsi dan kelas tingkat tinggi yang membuatnya mudah untuk mengkonsumsi sumber daya HTTP. Platform-independen, dan dapat digunakan pada baris perintah dan browser.
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:quran_digital/models/allasmaul.dart';
import 'package:quran_digital/models/allayat.dart';
import 'package:quran_digital/models/alldoa.dart';
//dart async adalah paket Dukungan untuk pemrograman asinkron, dengan kelas-kelas seperti Future dan Stream.
import 'dart:async';

import 'package:quran_digital/models/suratinfo.dart';

/*
*Objek Masa Depan mewakili perhitungan yang nilai kembaliannya mungkin belum tersedia. Future mengembalikan nilai perhitungan ketika itu selesai pada suatu waktu di masa depan. Futures sering digunakan untuk perhitungan yang berpotensi panjang seperti I / O dan interaksi dengan pengguna.
*/
/*
*kelas Service  yang nantinya dibanggil saat membuat list of data menggunakan ListView.builder
*/
class Services {
  //Quran Kemenag
  String surahinfo = "surah/surahinfo.json";

  Future<List<SuratInfo>> getSurah() async {
    var response = await rootBundle.loadString("surah/surahinfo.json");
    Iterable data = json.decode(response);
    return data.map((model) => SuratInfo.fromJson(model)).toList();
  }

  Future<AllAyat> loadAyat(int number) async {
    final response = await rootBundle.loadString('surah/$number.json');
    var res = json.decode(response);
    var data = res['$number'];
    return AllAyat.fromJson(data);
  }

  Future<List<AllAsmaul>> getAsmaul() async {
    var response = await rootBundle.loadString("surah/asmaul-husna.json");
    var res = json.decode(response);
    Iterable data = res['data'];
    return data.map((model) => AllAsmaul.fromJson(model)).toList();
  }

  Future<List<AllDoa>> getDoa() async {
    var response = await rootBundle.loadString("surah/doa-harian.json");
    var res = json.decode(response);
    Iterable data = res['data'];
    return data.map((model) => AllDoa.fromJson(model)).toList();
  }
}
