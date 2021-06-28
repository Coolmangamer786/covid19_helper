import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:covid19_helper/constants.dart';
import 'package:covid19_helper/containers/rounded_container_with_icons.dart';
import 'package:covid19_helper/pages/testings.dart';
import 'package:covid19_helper/webpage/webpage.dart';


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
  @override
  Widget build(BuildContext context) {
    final Color decide = Theme.of(context).accentColor;
    final Color bgColor = decide == Colors.indigo ? kBlackBack: kSomewhatWhite;
    final Color txtColor = decide == Colors.indigo ? Colors.white: Colors.black;
    return Scaffold(
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
                        HomepageText(title: 'Homepage', size: 65,txtColor: txtColor,),
                        HomepageText(title: 'get', size: 50,txtColor: txtColor,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                'Live Covid Data',
                                textStyle: GoogleFonts.bebasNeue(
                                    textStyle: kContTextStyle.copyWith(
                                        color: txtColor, fontSize: 50)),
                              ),
                              TypewriterAnimatedText(
                                'Vaccine Status',
                                textStyle: GoogleFonts.bebasNeue(
                                    textStyle: kContTextStyle.copyWith(
                                        color: txtColor, fontSize: 50)),
                              ),
                              TypewriterAnimatedText(
                                'Useful Resources',
                                textStyle: GoogleFonts.bebasNeue(
                                    textStyle: kContTextStyle.copyWith(
                                        color: txtColor, fontSize: 50)),
                              ),
                              TypewriterAnimatedText(
                                'Vaccine Details ',
                                textStyle: GoogleFonts.bebasNeue(
                                    textStyle: kContTextStyle.copyWith(
                                        color: txtColor, fontSize: 50)),
                              ),
                              TypewriterAnimatedText(
                                'Useful Links',
                                textStyle: GoogleFonts.bebasNeue(
                                    textStyle: kContTextStyle.copyWith(
                                        color: txtColor, fontSize: 50)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
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


                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Webpage(pageName: 'Vaccine Details', pageUrl: 'https://coolmangamer786.github.io/covid19resources/vaccine_details.html')));
                            },
                            child: RoundedContainer2(
                            title: 'vaccine details',
                            icon: FontAwesomeIcons.fileAlt,
                            borderColor: kYellowCont,
                           boxColor: bgColor,
                          ),
                          ),
                        ),
                        Padding(
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Webpage(pageName: "Do's and Dont's",
                                       pageUrl: 'https://coolmangamer786.github.io/covid19resources/index.html')));
                            },
                            child: RoundedContainer2(
                              title: "Do's and Dont's",
                              icon: FontAwesomeIcons.lightbulb,
                              borderColor: kBlueCont,
                             boxColor: bgColor,
                            ),

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => UsefulLinks()));
                            },
                            child: RoundedContainer2(
                              title:  "Spreadsheets",
                              icon: Icons.link,
                              borderColor: kVioletCont,
                             boxColor: bgColor,
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
    );
  }
}

class HomepageText extends StatelessWidget {
  const HomepageText({Key? key, required this.title, required this.size,required this.txtColor}) : super(key: key);
  final String title;
  final double size;
  final Color txtColor; 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: GoogleFonts.bebasNeue(
            textStyle:
                kContTextStyle.copyWith(color: txtColor, fontSize: size)),
      ),
    );
  }
}

void _launchURL(url) async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';