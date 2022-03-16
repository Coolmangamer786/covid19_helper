// To parse required this JSON data, do
//
//     final resourses = resoursesFromJson(jsonString);

// import 'dart:convert';

// CovidData covidDataFromJson(String str) =>
//     json.decode(str).map((x) => CovidData.fromJson(x));

// List<CovidData> covidFromJson(String str) =>
//     List<CovidData>.from(json.decode(str).map((x) => CovidData.fromJson(x)));

class CovidData {
  CovidData(
      {required this.country,
      required this.newConfirmed,
      required this.totalConfirmed,
      required this.newDeaths,
      required this.totalDeaths,
      required this.newRecoveded,
      required this.totalRecovered});

  String country;
  int newConfirmed,
      totalConfirmed,
      newDeaths,
      totalDeaths,
      newRecoveded,
      totalRecovered;

  factory CovidData.fromJson(Map<String, dynamic> json) => CovidData(
        country: json["Country"],
        newConfirmed: json["NewConfirmed"],
        totalConfirmed: json["TotalConfirmed"],
        newDeaths: json["NewDeaths"],
        totalDeaths: json["TotalDeaths"],
        newRecoveded: json["NewRecovered"],
        totalRecovered: json["TotalRecovered"],
      );
}
