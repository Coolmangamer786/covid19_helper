import 'package:covid19_helper/theme_changer.dart';
import 'package:covid19_helper/webpage/webpage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:url_launcher/url_launcher.dart';

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
  'Share with friends',
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
  void _sendMail(String _url) async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Could  $_url';

  String supportMail = 'covid19helper@outlook.com';
  String message = '';

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
                builder: (context) => Webpage(
                    pageName: 'How to use',
                    pageUrl: 'https://bit.ly/3yCeFWS')));
      } else if (select == 'Share with friends') {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('Share with friends'),
                  content: Text('Thanks for the needful 💌. \nTap on Share Now to share with others'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Share.share(
                            'I am using Covid19 Helper for latest Covid Stats, Useful resources, and much more features🔥.\n\n🎯If you want those features download the Covid19 Helper app now. https://bit.ly/3hqlbtV');
                        Navigator.pop(context);
                      },
                      child: Text('Share Now'),
                    ),
                    
                  ],
                ));
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
          applicationName: 'COVID19 HELPER',
          applicationVersion: '1.0.0',
          applicationLegalese:
              '💝 Thanks for using this app \nThis app is developed by 😎 Coolman Gamer.\n' +
                  'If you face in any difficulties try watching how to use'+
                  '\nThere is also a feature where you can request and report a problem.'+
                  'If you face more difficulties try contacting us.',
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
                      onChanged: (value) {
                        this.message = value;
                      },
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  print('onChanged : $message');
                  _sendMail('mailto:$supportMail?subject=$desc&body=$message');
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Click Here to Send '),
                    FaIcon(
                      FontAwesomeIcons.stepForward,
                      size: 16,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
