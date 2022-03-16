import 'package:covid19_helper/models/resourses-api.dart';
import 'package:http/http.dart' as http;

class ResourceService {
  static var client = http.Client();

  static Future<List<Resourses>> fetchProducts(String url) async {
    var response = await client.get(Uri.parse(
        "https://coolmangamer786.github.io/covid19resources/$url.json"));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print(resoursesFromJson(jsonString));
      return resoursesFromJson(jsonString);
    }
    return [];
  }
}
