import 'dart:convert';

class SurahInfo {
  final Map<String, dynamic> data;
  final String id;
  final String name;
  final String arab;
  final String translate;
  final String countAyat;

  //BUAT CONSTRUCTOR UNTUK MEMINTA DATA KETIKA CLASS INI DI-LOAD
  SurahInfo(
      {this.data,
      this.id,
      this.name,
      this.arab,
      this.translate,
      this.countAyat});

  factory SurahInfo.createInfo(Map<String, dynamic> json) {
    return SurahInfo(
      data: json['data'],
      id: json['id'].toString(),
      name: json['surat_name'],
      arab: json['surat_text'],
      translate: json['surat_terjemahan'],
      countAyat: json['count_ayat'].toString(),
    );
  }
}
