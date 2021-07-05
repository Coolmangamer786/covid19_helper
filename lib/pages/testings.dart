import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
        Theme.of(context).accentColor == KTealLight? kBlackBack : kPinkCont;

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
            subtitle: Text("Click Here to Visit"),
            onTap: () {
              _launchURL(testLinks[i]);
            },
          );
        });
  }

  Widget buildSelf(BuildContext context) {
    return ListView.builder(
        itemCount: 1,
        itemBuilder: (context, int i) {
          return ListTile(
            title: Text("Covi Self"),
            subtitle: Text("Click Here to Visit"),
            onTap: (){
              _launchURL('https://www.flipkart.com/mylab-coviself-covid-19-rapid-antigen-self-test-kit/p/itm4d34ea09cad97?pid=DTGG3AQ7X9XBSUZY&lid=LSTDTGG3AQ7X9XBSUZYAOGLHJ&marketplace=FLIPKART&q=covid+rapid+test+kit&store=hlc%2F20m%2Fled%2Fm3n&srno=s_1_1&otracker=AS_QueryStore_OrganicAutoSuggest_1_5_na_na_na&otracker1=AS_QueryStore_OrganicAutoSuggest_1_5_na_na_na&fm=SEARCH&iid=672e0cd9-1d88-4d68-a41f-893368451264.DTGG3AQ7X9XBSUZY.SEARCH&ppt=sp&ppn=sp&ssid=txkiztl4ds0000001625427484976&qH=9e6e0ad6daf01d2d');
            },
          );
        });
  }

  void _launchURL(url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
