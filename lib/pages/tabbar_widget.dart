

import 'package:covid19_helper/constants.dart';
import 'package:covid19_helper/districts/district_tracker.dart';
import 'package:covid19_helper/pages/state_tracker.dart';
import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class MyDemo extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    final Color bgColor = Theme.of(context).accentColor == KTealLight ? kBlackBack: kPinkCont;
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:bgColor,
          title: const Text('Data Tracker'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: 'State Level',
                // icon: Icon(Icons.cloud_outlined),
              ),
              Tab(
                text: 'District Level',
                // icon: Icon(Icons.beach_access_sharp),
              ),
              // Tab(
              //   icon: Icon(Icons.brightness_5_sharp),
              // ),
            ],
          ),
        ),
        body:  TabBarView(
          children: <Widget>[
            ShowCaseWidget(builder: Builder(builder:(context)=> StateTracker(),),),
            DistrictTracker(),
            // UserNetworkPage()
            // Center(
            //   child: Text("It's sunny here"),
            // ),
          ],
        ),
      ),
    );
  }

 
}
