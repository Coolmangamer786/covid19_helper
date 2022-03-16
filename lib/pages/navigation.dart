import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:covid19_helper/pages/homepage.dart';
import 'package:covid19_helper/pages/resourses_page.dart';
import 'package:covid19_helper/pages/setting.dart';
import 'package:covid19_helper/pages/tracker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  Color color = Colors.red;
  int _selectedIndex = 0;
  static final List _widgetOptions = [
    const Homepage(),
    TrackingPage(),
    const ResoursesPage(),
    const SettingsPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color navbarBrightness =
        AdaptiveTheme.of(context).brightness == Brightness.dark
            ? Colors.green.shade600
            : Colors.red;

    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const FaIcon(
              FontAwesomeIcons.home,
            ),
            label: 'Home',
            backgroundColor: navbarBrightness,
          ),
          BottomNavigationBarItem(
            icon: const FaIcon(FontAwesomeIcons.chartLine),
            label: 'Tracker',
            backgroundColor: navbarBrightness, //Color(0xff030303)
          ),
          BottomNavigationBarItem(
            backgroundColor: navbarBrightness,
            icon: const FaIcon(
              FontAwesomeIcons.database,
            ),
            label: 'Resources',
          ),
          BottomNavigationBarItem(
            icon: const FaIcon(
              FontAwesomeIcons.cog,
            ),
            label: 'Settings',
            backgroundColor: navbarBrightness,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
