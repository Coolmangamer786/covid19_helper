// To parse required this JSON data, do
//
//     final resourses = resoursesFromJson(jsonString);

import 'dart:convert';

List<Resourses> resoursesFromJson(String str) =>
    List<Resourses>.from(json.decode(str).map((x) => Resourses.fromJson(x)));

String resoursesToJson(List<Resourses> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Resourses {
  Resourses({
    required this.name,
    required this.links,
  });

  String name;
  String links;

  factory Resourses.fromJson(Map<String, dynamic> json) => Resourses(
        name: json["NAME"],
        links: json["LINKS"],
      );

  Map<String, dynamic> toJson() => {
        "NAME": name,
        "LINKS": links,
      };
}
