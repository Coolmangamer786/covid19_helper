import 'package:flutter/material.dart';

import '../constants.dart';

class Testings extends StatefulWidget {
  Testings({Key? key}) : super(key: key);

  @override
  _TestingsState createState() => _TestingsState();
}

class _TestingsState extends State<Testings> {
  List testName = [
    "AIRTABLE TESTING",
    "ICMR SWAB COLLECTION CENTER",
    
  ];
  List testLinks = [
    "https://airtable.com/shrA0I4rCGr0EDBYP",
    "https://covid19cc.nic.in/ICMR/Citizen/CCList.aspx"
    
  ];
  @override
  Widget build(BuildContext context) {
    final Color bgColor =
        Theme.of(context).accentColor == Colors.indigo ? kBlackBack : kPinkCont;

    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: bgColor,
          title: const Text('Tesings'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Normal',
                // icon: Icon(Icons.cloud_outlined),
              ),
              Tab(
                text: 'Self Testing',
                // icon: Icon(Icons.beach_access_sharp),
              ),
              // Tab(
              //   icon: Icon(Icons.brightness_5_sharp),
              // ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            buildTest(context),
            buildSelf(context),
            // UserNetworkPage()
            // Center(
            //   child: Text("It's sunny here"),
            // ),
          ],
        ),
      ),
    );
  }

  Widget buildTest(BuildContext context) {
    return ListView.builder(
        itemCount: 2,
        itemBuilder: (context, int i) {
          return ListTile(
            title: Text(testName[i]),
            subtitle: Text(testLinks[i]),
          );
        });
  }

  Widget buildSelf(BuildContext context) {
    return ListView.builder(
        itemCount: 1,
        itemBuilder: (context, int i) {
          return ListTile(
            title: Text("Self Lab"),
            subtitle: Text("Selflab.com"),
          );
        });
  }
}
