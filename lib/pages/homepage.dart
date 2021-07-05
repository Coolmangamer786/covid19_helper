import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:covid19_helper/constants.dart';
import 'package:covid19_helper/containers/rounded_container_with_icons.dart';
import 'package:covid19_helper/pages/testings.dart';
import 'package:covid19_helper/pages/useful_resources.dart';
import 'package:covid19_helper/webpage/webpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:showcaseview/showcaseview.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  GlobalKey _one = GlobalKey();
  GlobalKey _two = GlobalKey();
  GlobalKey _three = GlobalKey();
  GlobalKey _four = GlobalKey();
  GlobalKey _five = GlobalKey();
//  @override
//   void initState() {
//     super.initState();

//     WidgetsBinding.instance!.addPostFrameCallback(
//       (_) => ShowCaseWidget.of(context)!.startShowCase([
//         _one,_two,_three,_four,_five
//       ]),
//     );
//   }
  @override
  Widget build(BuildContext context) {
    final Color decide = Theme.of(context).accentColor;
    final Color bgColor = decide == KTealLight ? kBlackBack : kSomewhatWhite;
    final Color txtColor = decide == KTealLight ? Colors.white : Colors.black;
    SharedPreferences preferences;

    displayShowcase() async {
      preferences = await SharedPreferences.getInstance();
      bool? showcaseVisibilityStatus = preferences.getBool("showShowcase");
      if (showcaseVisibilityStatus == null) {
        preferences.setBool("showShowcase", false).then((bool success) {
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
        ShowCaseWidget.of(context)!
            .startShowCase([_one, _two, _three, _four, _five]);
      }
    });

    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                // height: MediaQuery.of(context).size.height,
                // width: MediaQuery.of(context).size.width,
                // color: kSomewhatWhite,
                title: Column(
                  children: [
                    Container(
                      // height: MediaQuery.of(context).size.height * .3,
                      width: double.infinity,
                      // color: Colors.yellow,
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HomepageText(
                            title: 'welcome'.toUpperCase(),
                            txtColor: txtColor,
                          ),
                          HomepageText(
                            title: 'get'.toUpperCase(),
                            txtColor: txtColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: AnimatedTextKit(
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  'Live Covid Data'.toUpperCase(),
                                  textStyle: GoogleFonts.bebasNeue(
                                      textStyle: kContTextStyle.copyWith(
                                          color: txtColor, fontSize: 40)),
                                ),
                                TypewriterAnimatedText(
                                  'Vaccine Status'.toUpperCase(),
                                  textStyle: GoogleFonts.bebasNeue(
                                      textStyle: kContTextStyle.copyWith(
                                          color: txtColor, fontSize: 40)),
                                ),
                                TypewriterAnimatedText(
                                  'Useful Resources'.toUpperCase(),
                                  textStyle: GoogleFonts.bebasNeue(
                                      textStyle: kContTextStyle.copyWith(
                                          color: txtColor, fontSize: 40)),
                                ),
                                TypewriterAnimatedText(
                                  'Vaccine Details '.toUpperCase(),
                                  textStyle: GoogleFonts.bebasNeue(
                                      textStyle: kContTextStyle.copyWith(
                                          color: txtColor, fontSize: 40)),
                                ),
                                TypewriterAnimatedText(
                                  'Useful Links'.toUpperCase(),
                                  textStyle: GoogleFonts.bebasNeue(
                                      textStyle: kContTextStyle.copyWith(
                                          color: txtColor, fontSize: 40)),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Showcase(
                            key: _one,
                            description: 'Click here for Vaccine Registration',
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  _launchURL('https://www.cowin.gov.in/');
                                },
                                child: RoundedContainer2(
                                  title: 'vaccine registration',
                                  icon: FontAwesomeIcons.calendarCheck,
                                  borderColor: kPinkCont,
                                  boxColor: bgColor,
                                ),
                              ),
                            ),
                          ),
                          Showcase(
                            key: _two,
                            description: 'Click Here for Vaccine Details',
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Webpage(
                                              pageName: 'Vaccine Details',
                                              pageUrl:
                                                  'https://coolmangamer786.github.io/covid19resources/vaccine_details.html')));
                                },
                                child: RoundedContainer2(
                                  title: 'vaccine details',
                                  icon: FontAwesomeIcons.fileAlt,
                                  borderColor: kYellowCont,
                                  boxColor: bgColor,
                                ),
                              ),
                            ),
                          ),
                          Showcase(
                            key: _three,
                            description: 'Click Here for Covid Testings ',
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Testings()));
                                },
                                child: RoundedContainer2(
                                  title: "Testings",
                                  icon: FontAwesomeIcons.lightbulb,
                                  borderColor: kGreenCont,
                                  boxColor: bgColor,
                                ),
                              ),
                            ),
                          ),
                          Showcase(
                            key: _four,
                            description: "Click Here for Do's and dont's ",
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Webpage(
                                              pageName: "Do's and Dont's",
                                              pageUrl:
                                                  'https://coolmangamer786.github.io/covid19resources/index.html')));
                                },
                                child: RoundedContainer2(
                                  title: "Do's and Dont's",
                                  icon: FontAwesomeIcons.lightbulb,
                                  borderColor: kBlueCont,
                                  boxColor: bgColor,
                                ),
                              ),
                            ),
                          ),
                          Showcase(
                            key: _five,
                            description: 'Click Here for Helpful Spreadsheets ',
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => RedirectedPage(
                                              name: 'Spreadsheets')));
                                },
                                child: RoundedContainer2(
                                  title: "Spreadsheets",
                                  icon: Icons.link,
                                  borderColor: kVioletCont,
                                  boxColor: bgColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}

class HomepageText extends StatelessWidget {
  const HomepageText({Key? key, required this.title, required this.txtColor})
      : super(key: key);
  final String title;

  final Color txtColor;
  @override
  Widget build(BuildContext context) {
    var height1 = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        title,
        style: GoogleFonts.bebasNeue(
            textStyle: kContTextStyle.copyWith(color: txtColor, fontSize: 40)),
      ),
    );
  }
}

void _launchURL(url) async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
