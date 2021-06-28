import 'package:covid19_helper/constants.dart';
import 'package:covid19_helper/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeChanger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String mode=Theme.of(context).accentColor==Colors.indigo?'Dark Mode':'Light Mode';
    final Color appBarColor=Theme.of(context).accentColor == Colors.indigo?
    kBlackBack:kPinkCont;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:appBarColor,
        title: Text(
          "Theme Changer",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Consumer<ThemeNotifier>(
                builder: (context, notifier, child) => SwitchListTile(
                  title: Text("Light Mode"),
                  onChanged: (value) {
                    notifier.toggleTheme();
                  },
                  value: notifier.darkTheme,
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                      "Your are currently using $mode."),
                ),
              ),
             
            ]),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.share),
          backgroundColor: Theme.of(context).accentColor),
    );
  }
}
