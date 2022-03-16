import 'dart:convert';

import 'package:covid19_helper/models/covid_api.dart';
import 'package:http/http.dart' as http;

class CovidService {
  static var client = http.Client();
  static Future<List<CovidData>> fetchCovidDatas() async {
    var response =
        await client.get(Uri.parse("https://api.covid19api.com/summary"));
    if (response.statusCode == 200) {
      print("Calling Data");
      // print(response.body);
      return (json.decode(response.body)['Countries'] as List)
          .map((e) => CovidData.fromJson(e))
          .toList();
    }
    return [];
  }
}
