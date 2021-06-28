class Resources {
  final String name;
  final String links;

  const Resources(
      {required this.name,required this.links});

  static Resources fromJson(json) => Resources(
        name: json['NAME'],
        links: json['LINKS'],
      );
}