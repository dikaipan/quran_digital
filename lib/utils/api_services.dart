import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/services.dart';

import 'package:quran_digital/models/surah_info.dart';

class Services {
  String apiUrl = "https://quran.kemenag.go.id/index.php/api/v1/surat";

  Future<List<SurahInfo>> getInfo() async {
    var apiResult = await http.get(apiUrl);
    var jsonObject = json.decode(apiResult.body);
    List<dynamic> listsurah = (jsonObject as Map<String, dynamic>)['data'];
    List<SurahInfo> info = [];
    for (int i = 0; i < listsurah.length; i++)
      info.add(SurahInfo.createInfo(listsurah[i]));
    return info;
  }
}
