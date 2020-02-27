//*untuk memparse data dari Json dibutuhkan Package dari dart yaitu dart convert
import 'dart:convert';

//*Widget List Digunakan untuk membuat list dari data Alquran yang sudah di mapping
List<Map<String, AlQuran>> alQuranFromJson(String str) =>
    List<Map<String, AlQuran>>.from(json.decode(str).map((x) => Map.from(x)
        .map((k, v) => MapEntry<String, AlQuran>(k, AlQuran.fromJson(v)))));

String alQuranToJson(List<Map<String, AlQuran>> data) =>
    json.encode(List<dynamic>.from(data.map((x) =>
        Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())))));

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
class AlQuran {
  String number;
  String name;
  String nameLatin;
  String numberOfAyah;

  Map<String, String> text;
  Translations translations;
  Tafsir tafsir;
/*
*konstruktor dari kelas AlQuran
*konstruktor di dalam bahasa dart ini digunakan untuk menampung parameter data yang diambil
*dari class Allsurah
*/
  AlQuran({
    this.number,
    this.name,
    this.nameLatin,
    this.numberOfAyah,
    this.text,
    this.translations,
    this.tafsir,
  });
/*
*kemudian Factory method di dart berguna untuk membuild atau membuat
*objek dari class hasil dari mapping(Map) File json Array 
*map di dart berguna untuk memetakan isi dari file Json Array yg membutuhkan parameter key dan value
*/
  factory AlQuran.fromJson(Map<String, dynamic> json) => AlQuran(
        number: json["number"] == null ? null : json["number"],
        name: json["name"] == null ? null : json["name"],
        nameLatin: json["name_latin"] == null ? null : json["name_latin"],
        numberOfAyah:
            json["number_of_ayah"] == null ? null : json["number_of_ayah"],
        text: json["text"] == null
            ? null
            : Map.from(json["text"])
                .map((k, v) => MapEntry<String, String>(k, v)),
        translations: json["translations"] == null
            ? null
            : Translations.fromJson(json["translations"]),
        tafsir: json["tafsir"] == null ? null : Tafsir.fromJson(json["tafsir"]),
      );

  Map<String, dynamic> toJson() => {
        "number": number == null ? null : number,
        "name": name == null ? null : name,
        "name_latin": nameLatin == null ? null : nameLatin,
        "number_of_ayah": numberOfAyah == null ? null : numberOfAyah,
        "text": text == null
            ? null
            : Map.from(text).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "translations": translations == null ? null : translations.toJson(),
        "tafsir": tafsir == null ? null : tafsir.toJson(),
      };
}

//*Class ini berguna untuk mengambil field data id dari File json Array
class Tafsir {
  TafsirId id;

  Tafsir({
    this.id,
  });

  factory Tafsir.fromJson(Map<String, dynamic> json) => Tafsir(
        id: json["id"] == null ? null : TafsirId.fromJson(json["id"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id.toJson(),
      };
}

//*Class ini berguna untuk mengambil field data kemenag dari File json Array
class TafsirId {
  Kemenag kemenag;

  TafsirId({
    this.kemenag,
  });

  factory TafsirId.fromJson(Map<String, dynamic> json) => TafsirId(
        kemenag:
            json["kemenag"] == null ? null : Kemenag.fromJson(json["kemenag"]),
      );

  Map<String, dynamic> toJson() => {
        "kemenag": kemenag == null ? null : kemenag.toJson(),
      };
}

//*Map ini berguna untuk mengambil field data name,source dan text dari File json Array
class Kemenag {
  String name;
  String source;
  //*memapping kembali agar field text dapat diambil
  Map<String, String> text;

  Kemenag({
    this.name,
    this.source,
    this.text,
  });

  factory Kemenag.fromJson(Map<String, dynamic> json) => Kemenag(
        name: json["name"] == null ? null : json["name"],
        source: json["source"] == null ? null : json["source"],
        text: json["text"] == null
            ? null
            : Map.from(json["text"])
                .map((k, v) => MapEntry<String, String>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "source": source == null ? null : source,
        "text": text == null
            ? null
            : Map.from(text).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

//*Class ini berguna untuk mengambil field data id dari File json Array
class Translations {
  TranslationsId id;

  Translations({
    this.id,
  });

  factory Translations.fromJson(Map<String, dynamic> json) => Translations(
        id: json["id"] == null ? null : TranslationsId.fromJson(json["id"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id.toJson(),
      };
}

//*Class ini berguna untuk mengambil field data name dan text dari File json Array
class TranslationsId {
  String name;
  //*memapping kembali agar field text dapat diambil
  Map<String, String> text;

  TranslationsId({
    this.name,
    this.text,
  });

  factory TranslationsId.fromJson(Map<String, dynamic> json) => TranslationsId(
        name: json["name"] == null ? null : json["name"],
        text: json["text"] == null
            ? null
            : Map.from(json["text"])
                .map((k, v) => MapEntry<String, String>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "text": text == null
            ? null
            : Map.from(text).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
