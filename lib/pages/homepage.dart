// ignore_for_file: unrelated_type_equality_checks

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:covid19_helper/containers/smallest_container.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color appbarBrightness =
        AdaptiveTheme.of(context).brightness == Brightness.dark
            ? Colors.black12.withOpacity(.1)
            : Colors.grey.shade50;

    Color textColor = AdaptiveTheme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;
    return Scaffold(
      // backgroundColor: scaffoldColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appbarBrightness,
        title: Text("Home",
            style: TextStyle(
                fontFamily: "BebasNene", fontSize: 30, color: textColor)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SmallContainer(
              name: "Vaccine Registration",
              color: Colors.red,
              url: "https://www.cowin.gov.in/",
            ),
            SmallContainer(
              name: "Vaccine Details",
              color: Colors.orange,
              url: 'https://bit.ly/2TQIC6Q',
            ),
            SmallContainer(
              name: "Covid Testings ",
              color: Colors.green,
              url: "https://www.google.com/search?q=covid+testing+near+me",
            ),
            SmallContainer(
              name: "Do's and Dont's",
              color: Colors.blue,
              url: 'https://bit.ly/3xwjS2h',
            ),
          ],
        ),
      ),
    );
  }
}
