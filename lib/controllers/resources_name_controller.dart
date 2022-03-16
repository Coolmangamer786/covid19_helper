import 'package:get/get.dart';

class ResoursesNameController extends GetxController {
  final name = "beds".obs;

  @override
  void onInit() {
    super.onInit();
  }

  setUrl(String url) {
    print("Calling set url");
    name(url);
  }
}
