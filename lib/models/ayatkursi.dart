class AyathKursi {
  String tafsir;
  String translation;
  String arabic;
  String latin;

  AyathKursi({
    this.tafsir,
    this.translation,
    this.arabic,
    this.latin,
  });

  factory AyathKursi.fromJson(Map<String, dynamic> json) => AyathKursi(
        tafsir: json["tafsir"],
        translation: json["translation"],
        arabic: json["arabic"],
        latin: json["latin"],
      );
}
