import 'package:covid19_helper/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:showcaseview/showcaseview.dart';

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
  'Share with others',
  'Report a problem',
  'About'
];
List settingIcons = [
  FontAwesomeIcons.adjust,
  FontAwesomeIcons.chalkboardTeacher,
  FontAwesomeIcons.plusCircle,
  FontAwesomeIcons.shareSquare,
  FontAwesomeIcons.bug,
  FontAwesomeIcons.infoCircle
];

class _UserSettingsState extends State<UserSettings> {
  @override
  Widget build(BuildContext context) {
    void buttonSelected(String select) {
      if (select == 'Switch Theme') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShowCaseWidget(
              builder: Builder(
                builder: (context) => ThemeChanger(),
              ),
            ),
          ),
        );
      } else if (select == 'Report a problem') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => request(
                context,
                'Report a problem',
                'I am facing this problem ',
                'Describe what problem your are facing'),
          ),
        );
      } else if (select == 'How to Use') {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => buildDemos(context, select)));
      } else if (select == 'Share with friends') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => buildDemos(context, select),
          ),
        );
      } else if (select == 'Request a feature') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => request(context, 'Request a feature',
                'I want this feature', 'Enter your suggetions here'),
          ),
        );
      } else if (select == 'About') {
        showAboutDialog(
          context: context,
          applicationName: 'COVID 19 HELPER',
          applicationVersion: '1.0.0',
          applicationLegalese:
              'This is the first version of or app \nSo good to see your here'
              ,
        );
      }
    }

    final Color bgColor =
        Theme.of(context).accentColor == KTealLight ? kBlackBack : kPinkCont;
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

  Widget buildDemos(BuildContext context, String selectName) {
    return Container(
      child: Center(child: Text('Working on $selectName')),
    );
  }

  Widget reqMore(BuildContext context) {
    return AlertDialog(
      title: Text('Request a feature'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(),
        ],
      ),
    );
  }

  Widget request(
      BuildContext context, String title, String desc, String event) {
    final borderColor = Theme.of(context).primaryColorDark;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('ok'))
                          ],
                          title: Text('Note'),
                          content: Text(
                              'Your will be redirected to your default mail app.'),
                        ));
              },
              icon: FaIcon(
                FontAwesomeIcons.infoCircle,
              ))
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * .4,
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                      color: borderColor.withOpacity(.1),
                      border: Border.all(color: Colors.blue, width: 4),
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      maxLines: 10,
                      maxLength: 250,
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: event,
                          hintText: desc),
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {}, child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Click Here to Send '),
                    FaIcon(FontAwesomeIcons.stepForward,size: 16,),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
