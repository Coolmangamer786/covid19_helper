import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:covid19_helper/containers/small_container_lite.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResoursesPage extends StatelessWidget {
  const ResoursesPage({Key? key}) : super(key: key);

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appbarBrightness,
        title: Text("Resources",
            style: TextStyle(
                fontFamily: "BebasNene", fontSize: 30, color: textColor)),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SmallContainerLite(
                small: "beds",
                item: 'Beds',
                icon: FontAwesomeIcons.bed,
                iconColor: Colors.red,
              ),
              SmallContainerLite(
                small: 'oxygen',
                item: 'Oxygen',
                icon: FontAwesomeIcons.peopleCarry,
                iconColor: Colors.red,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SmallContainerLite(
                small: "plasma",
                item: 'Plasma',
                icon: FontAwesomeIcons.burn,
                iconColor: Colors.orange,
              ),
              SmallContainerLite(
                small: 'medicine',
                item: 'Medicine',
                icon: FontAwesomeIcons.firstAid,
                iconColor: Colors.orange,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SmallContainerLite(
                small: "home icu",
                item: 'Home ICU',
                icon: FontAwesomeIcons.hospital,
                iconColor: Colors.lime.shade900,
              ),
              SmallContainerLite(
                small: 'ambulance',
                item: 'Ambulance',
                icon: FontAwesomeIcons.ambulance,
                iconColor: Colors.lime.shade900,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SmallContainerLite(
                  small: "outdoor",
                  item: 'Testing',
                  icon: FontAwesomeIcons.thermometer,
                  iconColor: Colors.green),
              SmallContainerLite(
                  small: 'doctors',
                  item: 'Doctor',
                  icon: FontAwesomeIcons.userNurse,
                  iconColor: Colors.green)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SmallContainerLite(
                  small: "ngo",
                  item: 'Ngo',
                  icon: FontAwesomeIcons.home,
                  iconColor: Colors.blue),
              SmallContainerLite(
                small: 'more',
                item: 'More',
                icon: FontAwesomeIcons.infoCircle,
                iconColor: Colors.blue,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SmallContainerLite(
                  small: "telegram",
                  item: 'Telegram Groups',
                  icon: FontAwesomeIcons.telegram,
                  iconColor: Colors.blue),
              SmallContainerLite(
                small: 'whatsapp',
                item: 'Whatsapp Groups',
                icon: FontAwesomeIcons.whatsapp,
                iconColor: Colors.green,
              )
            ],
          ),
        ]),
      ),
    );
  }
}
