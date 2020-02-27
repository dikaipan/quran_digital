/*
*untuk memparse data dari file Json dan API ada 3 hal yang harus dilakukan
todo 1.membuat class untuk menginisialisasi pengambilan data dari file Json yang dituju
todo 2.membuat Konstruktor dari kelas tersebut ,yang mana berguna untuk menerima atau memasukan value data dari Json File atupun API
todo 3.Class untuk Mengambil data dari file Json,di class ini kita ambil struktur data dari file json yang dibutuhkan
*Karna di dalam File json Quran ini adalah Json Array maka perlu memapping dahulu
*gunanya supaya file di dalam array tersebut dapat di panggil, dan utuk itu
*kita perlu membuat beberapa Class lagi yang gunanya untuk
*menampung data dari field *terjemahan *tafsir
*/
class SurahInfo {
  final String id;
  final String name;
  final String arab;
  final String translate;
  final String countAyat;

  //BUAT CONSTRUCTOR UNTUK MEMINTA DATA KETIKA CLASS INI DI-LOAD
  SurahInfo({this.id, this.name, this.arab, this.translate, this.countAyat});

  factory SurahInfo.createInfo(Map<String, dynamic> json) {
    return SurahInfo(
      id: json['id'].toString(),
      name: json['surat_name'],
      arab: json['surat_text'],
      translate: json['surat_terjemahan'],
      countAyat: json['count_ayat'].toString(),
    );
  }
}
