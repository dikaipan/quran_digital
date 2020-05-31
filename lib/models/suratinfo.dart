import 'dart:convert';

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
List<SuratInfo> suratInfoFromJson(String str) =>
    List<SuratInfo>.from(jsonDecode(str).map((x) => SuratInfo.fromJson(x)));

String surahInfoToJson(List<SuratInfo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

/*
 *konstruktor dari kelas SuratInfo
 *konstruktor di dalam bahasa dart ini digunakan untuk menampung parameter data yang diambil
*dari class Allsurah
*/
class SuratInfo {
  String arti;
  String asma;
  String audio;
  int ayat;
  String keterangan;
  String nama;
  int index;
  String rukuk;
  Type type;
  String urut;

  SuratInfo({
    this.arti,
    this.asma,
    this.audio,
    this.ayat,
    this.keterangan,
    this.nama,
    this.index,
    this.rukuk,
    this.type,
    this.urut,
  });

  /*
 *kemudian Factory method di dart berguna untuk membuild atau membuat
 *objek dari class hasil dari mapping(Map) File json Array
*map di dart berguna untuk memetakan isi dari file Json Array yg membutuhkan parameter key dan value
*/

  factory SuratInfo.fromJson(Map<String, dynamic> json) => SuratInfo(
        arti: json["arti"],
        asma: json["asma"],
        audio: json["audio"],
        ayat: json["ayat"],
        keterangan: json["keterangan"],
        nama: json["nama"],
        index: json["index"],
        rukuk: json["rukuk"],
        type: typeValues.map[json["type"]],
        urut: json["urut"],
      );

  Map<String, dynamic> toJson() => {
        "arti": arti,
        "asma": asma,
        "audio": audio,
        "ayat": ayat,
        "keterangan": keterangan,
        "nama": nama,
        "nomor": index,
        "rukuk": rukuk,
        "type": typeValues.reverse[type],
        "urut": urut,
      };
}

enum Type { MEKAH, MADINAH }

final typeValues = EnumValues({"madinah": Type.MADINAH, "mekah": Type.MEKAH});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
