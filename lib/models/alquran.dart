import 'dart:convert';

//untuk memparse data dari data dari file Json dan API ada 3 hal yang harus dilakukan
//1.membuat class untuk menginisialisasi pengambilan data dari file Json yang dituju
//2.membuat Konstruktor dari kelas tersebut ,
//yang mana berguna untuk menerima atau memasukan value data dari Json File atupun API
//3.
//Class untuk Mengambil data dari file Json,
//di class ini kita ambil struktur data dari file json yang dibutuhkan

//Karna di dalam File json Quran ini adalah Json Array maka perlu memapping dahulu
//gunanya supaya file di dalam array tersebut dapat di panggil, dan utuk itu
//kita perlu membuat beberapa Class lagi yang gunanya untuk
//menampung data dari field *terjemahan *tafsir
//   Map<String, String> text;
//   final Terjemahan translations;
//   final Tafsir tafsir;
///konstruktor dari kelas Allsurah
//konstruktor di dalam bahasa dart ini digunakan untuk menampung parameter data yang diambil
//dari class Allsurah
//   AlQuran({
//     this.number,
//     this.name,
//     this.nameLatin,
//     this.numberOfAyah,
//     this.text,
//     this.translations,
//     this.tafsir,
//   });

//kemudian Factory method di dart berguna untuk membuild / membuat
//objek dari class hasil dari mapping(Map) File json Array
//untuk memamping nantinya saya menggunakan Package dari Json_serialized
//yang gunanya untuk meng generate class model ALlSurah,terjemhahan dan tafsir yang saya buat
//map di dart berguna untuk memetakan isi dari file Json Array yg membutuhkan parameter key dan value
//   factory AlQuran.fromJson(Map<String, dynamic> json) => _$AlQuranFromJson(json
//       // number: json["number"],
//       // name: json["name"],
//       // nameLatin: json["name_latin"],
//       // numberOfAyah: json["number_of_ayah"],
//       // text: Map.from(json["text"])
//       //     .map((k, v) => MapEntry<String, String>(k, v)),
//       // translations: Terjemahan.fromJson(json["translations"]),
//       // tafsir: Tafsir.fromJson(json["tafsir"]),
//       );
// }

// //Class ini berguna untuk mengambil field data id dari File json Array

// //keyword untuk menggunakan jsonserializable
// @JsonSerializable()
// class Tafsir {
//   IdTafsir id;

//   Tafsir({
//     this.id,
//   });
//   factory Tafsir.fromJson(Map<String, dynamic> json) => _$TafsirFromJson(json
//       // id: IdTafsir.fromJson(json["id"]),
//       );
// }

// //Class ini berguna untuk mengambil field data kemenag dari File json Array

// //keyword untuk menggunakan jsonserializable
// @JsonSerializable()
// class IdTafsir {
//   Kemenag kemenag;

//   IdTafsir({
//     this.kemenag,
//   });
//   factory IdTafsir.fromJson(Map<String, dynamic> json) =>
//       _$IdTafsirFromJson(json
//           // kemenag: Kemenag.fromJson(json["kemenag"]),
//           );
// }

// //Class ini berguna untuk mengambil field data name,source dan text dari File json Array

// //keyword untuk menggunakan jsonserializable
// @JsonSerializable()
// class Kemenag {
//   String name;
//   String source;
//   //memapping kembali agar field text dapat diambil
//   Map<String, String> text;

//   Kemenag({
//     this.name,
//     this.source,
//     this.text,
//   });
//   factory Kemenag.fromJson(Map<String, dynamic> json) => _$KemenagFromJson(json
//       // name: json["name"],
//       // source: json["source"],
//       // text: Map.from(json["text"])
//       //     .map((key, value) => MapEntry<String, String>(key, value)),
//       );
// }

// //Class ini berguna untuk mengambil field data id dari File json Array

// //keyword untuk menggunakan jsonserializable
// @JsonSerializable()
// class Terjemahan {
//   IdTerjemahan id;

//   Terjemahan({
//     this.id,
//   });
//   factory Terjemahan.fromJson(Map<String, dynamic> json) =>
//       _$TerjemahanFromJson(json
//           // id: IdTerjemahan.fromJson(json["id"]),
//           );
// }

// //Class ini berguna untuk mengambil field data name dan text dari File json Array

// //keyword untuk menggunakan jsonserializable
// @JsonSerializable()
// class IdTerjemahan {
//   String name;
//   //memapping kembali agar field text dapat diambil
//   Map<String, String> text;

//   IdTerjemahan({
//     this.name,
//     this.text,
//   });
//   factory IdTerjemahan.fromJson(Map<String, dynamic> json) =>
//       _$IdTerjemahanFromJson(json
//           // name: json["name"],
//           // text: Map.from(json["text"])
//           //     .map((key, value) => MapEntry<String, String>(key, value)),
//           );
// }

// //Untuk menggenerate map dengan Json Serializable
// //kita harus menggunakan package Build_runner
// //untuk membuild map dari model dengan menggunakan
// //command di terminal dengan cara mengetikan <flutter packages pub run build_runner build>
