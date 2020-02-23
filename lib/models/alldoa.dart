class AllDoa {
  String title;
  String arabic;
  String latin;
  String translation;

  AllDoa({
    this.title,
    this.arabic,
    this.latin,
    this.translation,
  });

  factory AllDoa.fromJson(Map<String, dynamic> json) => AllDoa(
        title: json["title"],
        arabic: json["arabic"],
        latin: json["latin"],
        translation: json["translation"],
      );
}
