import 'package:covid19_helper/models/resourses-api.dart';
import 'package:covid19_helper/apis/resource_service.dart';
import 'package:covid19_helper/controllers/resources_name_controller.dart';

import 'package:get/get.dart';

class ResourceController extends GetxController {
  var productsList = <Resourses>[].obs;
  var isLoading = true.obs;
  final resourceName = Get.put(ResoursesNameController());
  @override
  void onInit() {
    print(resourceName.name.value);
    fetchProducts(resourceName.name.value);
    super.onInit();
  }

  void fetchProducts(String url) async {
    try {
      isLoading(true);
      var products = await ResourceService.fetchProducts(url);
      if (products != null) {
        productsList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
