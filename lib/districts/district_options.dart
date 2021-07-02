import 'package:covid19_helper/api_methods/api_methods.dart';
import 'package:covid19_helper/constants.dart';
import 'package:covid19_helper/districts/district_cases.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DistrictOptions extends StatelessWidget {
  DistrictOptions({Key? key, required this.shortName}) : super(key: key);
  String shortName;

  @override
  Widget build(BuildContext context) {
    String districtName = "";
       final Color appBarColor=Theme.of(context).accentColor == KTealLight?
    kBlackBack:kPinkCont;
    List dist = districtNameChecker(shortName);
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Districts'),
        backgroundColor: appBarColor,
      ),
      body: ListView.builder(
          itemCount: dist.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(dist[index]),
              onTap: () {
                districtName = dist[index];
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DisplayCases(dist: districtName, state: shortName)));
              },
            );
          }),
    );
  }
}
