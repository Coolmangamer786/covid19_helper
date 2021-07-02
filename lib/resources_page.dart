import 'package:covid19_helper/containers/small_container.dart';
import 'package:covid19_helper/pages/useful_resources.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';

class ResourcesPage extends StatelessWidget {
  const ResourcesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color appBarColor =
        Theme.of(context).accentColor == KTealLight ? kBlackBack : kPinkCont;
    // final Color manyIconColor = Theme.of(context).accentColor == Colors.indigo
    //     ? kSomewhatWhite
    //     : Colors.black;
    // final Color manyTextColor = Theme.of(context).accentColor == Colors.indigo
    //     ? Colors.black
    //     : Colors.white;
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
                          child: SmallContainer(
                            item: 'Beds',
                            icon: FontAwesomeIcons.bed,
                            iconColor: Color(0xfff94144),
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
                          child: SmallContainer(
                            item: 'Oxygen',
                            icon: FontAwesomeIcons.peopleCarry,
                            iconColor: Color(0xFFf3722c),
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
                          child: SmallContainer(
                            item: 'Plasma',
                            icon: FontAwesomeIcons.burn,
                            iconColor: Color(0xfff8961e),
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
                          child: SmallContainer(
                            item: 'Medicine',
                            icon: FontAwesomeIcons.firstAid,
                            iconColor: Color(0xfff9c74f),
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
                          child: SmallContainer(
                            item: 'Home ICU',
                            icon: FontAwesomeIcons.hospital,
                            iconColor: Color(0xff90be6d),
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
                          child: SmallContainer(
                            item: 'Ambulance',
                            icon: FontAwesomeIcons.ambulance,
                            iconColor: Color(0xff43aa8b),
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
                                    builder: (context) =>
                                        RedirectedPage(name: 'Testings')));
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
                        ),//b892ff
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          child: SmallContainer(
                            item: 'Ngo',
                            icon: FontAwesomeIcons.home,
                            iconColor: Color(0xff83c5be)
                          ),
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
                            iconColor: Color(0xff48cae4)
                            ,
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

                        // ElevatedButton(
                        //   onPressed: () {

                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) =>
                        //                 RedirectedPage(name: 'Telegram')));

                        //   },
                        //   child: Text('Telegram Groups'),
                        //   style: ButtonStyle(
                        //     backgroundColor:
                        //         MaterialStateProperty.all<Color>(Colors.blue),
                        //   ),

                        // ),
                        // ElevatedButton(
                        //   onPressed: () {

                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) =>
                        //                 RedirectedPage(name: 'Whatsapp')));

                        //   },
                        //   child: Text('Whatsapp Groups'),
                        //   style: ButtonStyle(
                        //     backgroundColor:
                        //         MaterialStateProperty.all<Color>(Colors.green),
                        //   ),
                        // )
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
