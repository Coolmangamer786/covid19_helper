import 'package:covid19_helper/apis/covid_service.dart';
import 'package:covid19_helper/containers/another_container.dart';
import 'package:covid19_helper/controllers/covid_data_controller.dart';
import 'package:covid19_helper/models/covid_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrackingPage extends StatelessWidget {
  TrackingPage({Key? key}) : super(key: key);
  final CovidDataController dataController = Get.put(CovidDataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Covid")),
      body: Obx(() {
        return dataController.isLoading.value == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: 1,
                itemBuilder: ((context, index) => Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              dataController.covid[77].country,
                              style: const TextStyle(
                                  fontSize: 30, fontFamily: 'BebasNene'),
                            ),
                          ),
                        ),
                        AnotherContainer(
                          color: Colors.red,
                          event: "Confirmed",
                          data: dataController.covid[77].totalConfirmed
                              .toString(),
                          today:
                              dataController.covid[77].newConfirmed.toString(),
                        ),
                        AnotherContainer(
                          color: Colors.green,
                          event: "Recovered",
                          data: dataController.covid[77].totalRecovered
                              .toString(),
                          today:
                              dataController.covid[77].newRecoveded.toString(),
                        ),
                        AnotherContainer(
                          color: Colors.blue,
                          event: "Deaths",
                          data: dataController.covid[77].totalDeaths.toString(),
                          today: dataController.covid[77].newDeaths.toString(),
                        ),
                      ],
                    )));
      }),
    );
  }
}
