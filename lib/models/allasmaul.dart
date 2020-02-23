class AllAsmaul {
  String index;
  String latin;
  String arabic;
  String translationId;
  String translationEn;

  AllAsmaul({
    this.index,
    this.latin,
    this.arabic,
    this.translationId,
    this.translationEn,
  });

  factory AllAsmaul.fromJson(Map<String, dynamic> json) => AllAsmaul(
        index: json["index"],
        latin: json["latin"],
        arabic: json["arabic"],
        translationId: json["translation_id"],
        translationEn: json["translation_en"],
      );
}
