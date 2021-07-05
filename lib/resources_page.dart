import 'package:covid19_helper/containers/small_container.dart';
import 'package:covid19_helper/pages/testings.dart';
import 'package:covid19_helper/pages/useful_resources.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';

import 'constants.dart';

class ResourcesPage extends StatefulWidget {
  const ResourcesPage({Key? key}) : super(key: key);

  @override
  _ResourcesPageState createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> {
  GlobalKey _eleven = GlobalKey();
  GlobalKey _twelve = GlobalKey();
  GlobalKey _thirteen = GlobalKey();
  GlobalKey _fourteen = GlobalKey();
  GlobalKey _fifteen = GlobalKey();
  GlobalKey _sixteen = GlobalKey();

  @override
  Widget build(BuildContext context) {
  
    final Color appBarColor =
        Theme.of(context).accentColor == KTealLight ? kBlackBack : kPinkCont;

    SharedPreferences preferences;

    displayShowcase() async {
      preferences = await SharedPreferences.getInstance();
      bool? showcaseVisibilityStatus = preferences.getBool("showShowcase2");
      if (showcaseVisibilityStatus == null) {
        preferences.setBool("showShowcase2", false).then((bool success) {
          if (success)
            print("Success ");
          else
            print("An error occured");
        });
        return true;
      }
      return false;
    }

    displayShowcase().then((status) {
      if (status) {
        ShowCaseWidget.of(context)!.startShowCase(
            [_eleven, _twelve, _thirteen, _fourteen, _fifteen, _sixteen]);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Useful Resources'),
        backgroundColor: appBarColor,
      ),
      body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 1,
          itemBuilder: (context, int index) {
            return Container(
              child: ListTile(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          child: Showcase(
                            key: _eleven,
                            description: 'Click here for bed links',
                            child: SmallContainer(
                              item: 'Beds',
                              icon: FontAwesomeIcons.bed,
                              iconColor: Color(0xfff94144),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RedirectedPage(name: 'Beds')));
                          },
                        ),
                        GestureDetector(
                          child: Showcase(
                            key: _twelve,
                            description: 'Click here for oxygen links',
                            child: SmallContainer(
                              item: 'Oxygen',
                              icon: FontAwesomeIcons.peopleCarry,
                              iconColor: Color(0xFFf3722c),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RedirectedPage(name: 'Oxygen')));
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          child: Showcase(
                            key: _thirteen,
                            description: 'Click here for plasma doners links',
                            child: SmallContainer(
                              item: 'Plasma',
                              icon: FontAwesomeIcons.burn,
                              iconColor: Color(0xfff8961e),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RedirectedPage(name: 'Plasma')));
                          },
                        ),
                        GestureDetector(
                          child: Showcase(
                            key: _fourteen,
                            description: 'Click here for medicine links',
                            child: SmallContainer(
                              item: 'Medicine',
                              icon: FontAwesomeIcons.firstAid,
                              iconColor: Color(0xfff9c74f),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RedirectedPage(name: 'Medicine')));
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          child: Showcase(
                            key: _fifteen,
                            description: 'Click here for Home ICU links',
                            child: SmallContainer(
                              item: 'Home ICU',
                              icon: FontAwesomeIcons.hospital,
                              iconColor: Color(0xff90be6d),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RedirectedPage(name: 'Home ICU')));
                          },
                        ),
                        GestureDetector(
                          child: Showcase(
                            key: _sixteen,
                            description:
                                'Click here for ambulance links \nAlso check ot other buttons too.',
                            child: SmallContainer(
                              item: 'Ambulance',
                              icon: FontAwesomeIcons.ambulance,
                              iconColor: Color(0xff43aa8b),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RedirectedPage(name: 'Ambulance')));
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          child: SmallContainer(
                            item: 'Testing',
                            icon: FontAwesomeIcons.thermometer,
                            iconColor: Color(0xffff90b3),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Testings()));
                          },
                        ),
                        GestureDetector(
                          child: SmallContainer(
                            item: 'Doctor',
                            icon: FontAwesomeIcons.userNurse,
                            iconColor: Color(0xfffec89a),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RedirectedPage(name: 'Doctors')));
                          },
                        ), //b892ff
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          child: SmallContainer(
                              item: 'Ngo',
                              icon: FontAwesomeIcons.home,
                              iconColor: Color(0xff83c5be)),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RedirectedPage(name: 'NGO')));
                          },
                        ),
                        GestureDetector(
                          child: SmallContainer(
                            item: 'More',
                            icon: FontAwesomeIcons.infoCircle,
                            iconColor: Color(0xff48cae4),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RedirectedPage(name: 'More')));
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          child: SmallContainer(
                            item: 'Telegram Groups',
                            icon: FontAwesomeIcons.telegram,
                            iconColor: Colors.blue,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RedirectedPage(name: 'Telegram')));
                          },
                        ),
                        GestureDetector(
                          child: SmallContainer(
                            item: 'Whatsapp Groups',
                            icon: FontAwesomeIcons.whatsapp,
                            iconColor: Colors.green,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RedirectedPage(name: 'Whatsapp')));
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
