
import 'package:covid19_helper/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';


class UserSettings extends StatefulWidget {
  UserSettings({Key? key}) : super(key: key);

  @override
  _UserSettingsState createState() => _UserSettingsState();
}

List<String> setting = [
  'Switch Theme',
  'How to Use',
  'Request a feature',
  'Donation',
  'Report a problem',
  'About'
];
List settingIcons = [
  FontAwesomeIcons.adjust,
  FontAwesomeIcons.chalkboardTeacher,
  FontAwesomeIcons.plusCircle,
  FontAwesomeIcons.donate,
  FontAwesomeIcons.bug,
  FontAwesomeIcons.infoCircle
];

class _UserSettingsState extends State<UserSettings> {
  @override
  Widget build(BuildContext context) {
    void buttonSelected(String select) {
      if (select == 'Switch Theme') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ThemeChanger()));
      }
      else if (select == 'Report a problem') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => buildDemos(context, select)));
      }
      else if (select == 'How to Use') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => buildDemos(context, select)));
      }
      else if (select == 'Donation') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => buildDemos(context, select)));
      }
      else if (select == 'Request a feature') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => buildDemos(context, select)));
      }
      else if (select =='About') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => buildDemos(context, select)));
      }
   
    }

    final Color bgColor = Theme.of(context).accentColor == Colors.indigo
        ? kBlackBack
        : kPinkCont;
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: bgColor,
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
          itemCount: setting.length,
          itemBuilder: (BuildContext context, int i) {
            return ListTile(
              title: Text(setting[i]),
              leading: Icon(settingIcons[i]),
              onTap: () {
                buttonSelected(setting[i]);
              },
            );
          }),
    );
  }

  Widget buildDemos(BuildContext context,String selectName) {
    return Container(child: Center(child: Text('Working on $selectName')),);
  }
}
