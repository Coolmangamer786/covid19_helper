import 'package:covid19_helper/districts/district_options.dart';
import 'package:flutter/material.dart';

class DistrictTracker extends StatefulWidget {
  DistrictTracker({Key? key}) : super(key: key);

  @override
  _DistrictTrackerState createState() => _DistrictTrackerState();
}

class _DistrictTrackerState extends State<DistrictTracker> {
  String sortName = '';
  List<String> stateNameLarge = [
    'Andaman and Nicobar',
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chandigarh',
    'Chhattisgarh',
    'Daman and Diu',
    'Delhi',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jammu and Kashmir',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Ladakh',
    'Lakshadweep',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Puducherry',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
          itemCount: stateNameLarge.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(stateNameLarge[index]),
              onTap: () {
                // sortName = stateNameChecker(stateNameLarge[index]);
                this.sortName=stateNameLarge[index];
                print(stateNameLarge[index]);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DistrictOptions(shortName: sortName)));
              },
            );
          }),
    );
  }


  

 
}
