// ignore_for_file: avoid_print

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    Color appbarBrightness =
        AdaptiveTheme.of(context).brightness == Brightness.dark
            ? Colors.black12.withOpacity(.1)
            : Colors.grey.shade50;

    Color textColor = AdaptiveTheme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;
    AdaptiveThemeMode groupValue = AdaptiveTheme.of(context).mode;
    print(AdaptiveTheme.of(context).brightness);
    print(AdaptiveTheme.of(context).brightness == Brightness.dark);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appbarBrightness,
        title: Text("Change Theme",
            style: TextStyle(
                fontFamily: "BebasNene", fontSize: 30, color: textColor)),
        actions: [
          IconButton(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  applicationName: 'COVID19 HELPER',
                  applicationVersion: '1.0.2',
                  applicationLegalese:
                      '💝 This is the second editon of the App \nApp is developed by 😎 Snehasis4321.\n' +
                          'It was done as a simple project' +
                          '\nA lot of features have been removed as the 👷 API is no longer supported.' +
                          '\nAnd Covid has also come to an end 💪..' +
                          '\nThanks for using this app.',
                );
              },
              icon: Icon(
                Icons.person_rounded,
                color: textColor,
              ))
        ],
      ),
      body: Column(children: [
        RadioListTile(
          title: const Text('System'),
          value: AdaptiveThemeMode.system,
          groupValue: groupValue,
          onChanged: (value) {
            setState(() {
              AdaptiveTheme.of(context).setSystem();
            });
          },
        ),
        RadioListTile(
          title: const Text('Dark'),
          value: AdaptiveThemeMode.dark,
          groupValue: groupValue,
          onChanged: (value) {
            setState(() {
              AdaptiveTheme.of(context).setDark();
            });
          },
        ),
        RadioListTile(
          title: const Text('Light'),
          value: AdaptiveThemeMode.light,
          groupValue: groupValue,
          onChanged: (value) {
            setState(() {
              AdaptiveTheme.of(context).setLight();
            });
          },
        ),
      ]),
    );
  }
}
