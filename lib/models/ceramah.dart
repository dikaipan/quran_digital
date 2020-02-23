
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

class Ceramah {
  final String videoId;
  final String title;
  final String channelId;
  final String channelTitle;
  final String image;

  Ceramah({
    @required this.videoId,
    @required this.title,
    @required this.channelId,
    @required this.channelTitle,
    @required this.image,
  });
  factory Ceramah.fromJson(Map<String, dynamic> json) => Ceramah(
        videoId: json['id']['videoId'],
        title: json['snippet']['title'],
        channelId: json['snippet']['channelId'],
        channelTitle: json['snippet']['channelTitle'],
        image: json['snippet']['thumbnails']['high']['url'],
      );
}
