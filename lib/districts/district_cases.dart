import 'package:covid19_helper/api_methods/api_methods.dart';
import 'package:covid19_helper/containers/rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

// ignore: must_be_immutable
class DisplayCases extends StatelessWidget {
  DisplayCases({Key? key, required this.dist, required this.state})
      : super(key: key);
  String dist, state;
  

  @override
  Widget build(BuildContext context) {
    final Color bgColor = Theme.of(context).accentColor == KTealLight
        ? kBlackBack
        : kSomewhatWhite;
    final Color textColor = Theme.of(context).accentColor == KTealLight
        ? kSomewhatWhite
        : kBlackBack;
    final Color appBarColor =
        Theme.of(context).accentColor == KTealLight ? kBlackBack : kPinkCont;

    displayMore(
      String topic,
      int data,
      String desc,
      String stateSelected,
    ) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              actions: [
                Center(
                  child: TextButton(
                      onPressed: () => Navigator.pop(
                            context,
                          ),
                      child: Text('Ok I will take safety measures 😷')),
                )
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: Text(topic),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Currently $topic in $stateSelected are : -'),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      data.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                  Text(
                    desc,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(dist),
        backgroundColor: appBarColor,
        actions: [IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('How to use'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '📌 Click on the -\n🎯 Confiremed,\n🎯 Recovered,\n🎯 Testings,\n🎯 Decreased \nfor more info.\n\nAnd click 💉 Vaccinated for Vaccine Status.\n\n📌 Above options May not be available if no data is provided from the related District.',
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('ok'))
                      ],
                    );
                  });
            },
            icon: FaIcon(
              FontAwesomeIcons.infoCircle,
              color: textColor,
            ),
          ),],
      ),
      body: Container(
        color: bgColor,
        child: FutureBuilder(
          future: getDistrictData(state, dist),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                  child: Center(
                      child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(kPinkCont),
              )));
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      tileColor: Colors.black,
                      title: Column(
                        children: [
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Text(stateSelected,style: kSubHeadText.copyWith(color:textColor),),
                          // ),

                          GestureDetector(
                            onTap: () {
                              displayMore(
                                  'Confirmed Cases',
                                  snapshot.data[index].confirmed,
                                  'Please be Stay Safe 🔒 and get Vaccinated 💉 as soon as possible.',
                                  dist);
                            },
                            child: RoundedContainer(
                              
                              borderColor: kPinkCont,
                              item: 'CONFIRMED CASES',
                              data: snapshot.data[index].confirmed.toString(),
                              boxColor: bgColor,
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              displayMore(
                                  'Recovered Cases',
                                  snapshot.data[index].recovered,
                                  'Never loose hope we can always get Recovered 💝 Stay Strong 💪 we will fight together against the Virus 👿.',
                                  dist);
                            },
                            child: RoundedContainer(
                               
                              borderColor: kYellowCont,
                              item: 'RECOVERED CASES',
                              data: snapshot.data[index].recovered.toString(),
                              boxColor: bgColor,
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              displayMore(
                                  'Testings Done',
                                  snapshot.data[index].tested,
                                  'For Testings please TESTING 🔥 visit  on Resources 🐻.',
                                  dist);
                            },
                            child: RoundedContainer(
                               
                              borderColor: kGreenCont,
                              item: 'Testings',
                              data: snapshot.data[index].tested.toString(),
                              boxColor: bgColor,
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        title: Text(
                                          'Vaccine Status : ',
                                        ),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  'Dose 1 :',
                                                ),
                                                Spacer(),
                                                Text(
                                                  snapshot.data[index].dose1
                                                      .toString(),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Dose 2 :',
                                                ),
                                                Spacer(),
                                                Text(
                                                  snapshot.data[index].dose2
                                                      .toString(),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Total  :',
                                                ),
                                                Spacer(),
                                                Text(
                                                  snapshot
                                                      .data[index].vaccinated
                                                      .toString(),
                                                )
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Take Your Vaccine 💉 soon cause it free and it effective ⚡ for fighting against the Virus 👿.',
                                                textAlign: TextAlign.center,
                                              ),
                                            )
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context, 'OK'),
                                              child: const Text('OK'))
                                        ],
                                      ));
                            },
                            child: RoundedContainer(
                               
                              borderColor: kBlueCont,
                              item: 'Vaccinated',
                              data: snapshot.data[index].vaccinated.toString(),
                              boxColor: bgColor,
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              displayMore(
                                  'Deaths',
                                  snapshot.data[index].deceased,
                                  'We have lost lot of peoples in our surrounding,Please be Safe 🔒 and Take Safety precautions',
                                  dist);
                            },
                            child: RoundedContainer(
                               
                              borderColor: kVioletCont,
                              item: 'Decreased',
                              data: snapshot.data[index].deceased.toString(),
                              boxColor: bgColor,
                            ),
                          ),

                        
                        ],
                      ),
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}
