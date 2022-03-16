import 'package:covid19_helper/apis/covid_service.dart';
import 'package:covid19_helper/models/covid_api.dart';

import 'package:get/get.dart';

class CovidDataController extends GetxController {
  var covid = <CovidData>[].obs;

  var isLoading = true.obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    try {
      isLoading(true);
      var datas = await CovidService.fetchCovidDatas();
      if (datas != null) {
        covid.value = datas;
      }
    } finally {
      isLoading(false);
    }
  }
}
