import 'package:connectivity/connectivity.dart';
import 'package:covid19_helper/constants.dart';
import 'package:covid19_helper/pages/homepage.dart';
import 'package:covid19_helper/pages/settings_page.dart';
import 'package:covid19_helper/pages/tabbar_widget.dart';
import 'package:covid19_helper/resources_page.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = [
    // Welcome(),
    // StateTracker(),
    // UsefulLinks(),
    Homepage(),
    MyDemo(),
    ResourcesPage(),
    UserSettings()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color decide = Theme.of(context).accentColor;
    final Color color = decide == KTealLight ? KTealLight : kPinkCont;
    return Scaffold(
      body: StreamBuilder(
        stream: Connectivity().onConnectivityChanged,
        builder:
            (BuildContext context, AsyncSnapshot<ConnectivityResult> snapshot) {
          if (snapshot.data != null &&
              snapshot.hasData &&
              snapshot.data != ConnectivityResult.none) {
            return DoubleBackToCloseApp(
              snackBar: const SnackBar(
                content: Text('Tap back again to leave'),
              ),
              child: Center(
                child: _widgetOptions.elementAt(_selectedIndex),
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.wifi_off,
                      size: 80,
                    ),
                  ),
                  Text(
                    'No Internet',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20,
        enableFeedback: true,
        unselectedItemColor: Colors.white.withOpacity(.7),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.home,
            ),
            label: 'Home',
            backgroundColor: color,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.chartLine),
            label: 'Tracker',
            backgroundColor: color, //Color(0xff030303)
          ),
          BottomNavigationBarItem(
            backgroundColor: color,
            icon: FaIcon(
              FontAwesomeIcons.database,
            ),
            label: 'Resources',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.cog,
            ),
            label: 'Settings',
            backgroundColor: color,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
