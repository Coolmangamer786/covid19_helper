import 'package:covid19_helper/api_methods/api_methods.dart';
import 'package:covid19_helper/containers/rounded_container.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

// ignore: must_be_immutable
class DisplayCases extends StatelessWidget {
  DisplayCases({Key? key, required this.dist, required this.state})
      : super(key: key);
  String dist, state;



  @override
  Widget build(BuildContext context) {
    final Color bgColor = Theme.of(context).accentColor == Colors.indigo
        ? kBlackBack
        : kSomewhatWhite;
    final Color textColor = Theme.of(context).accentColor == Colors.indigo
        ? kSomewhatWhite
        : kBlackBack;
    final Color appBarColor=Theme.of(context).accentColor == Colors.indigo?
    kBlackBack:kPinkCont;
    return Scaffold(
      appBar: AppBar(
        title: Text(dist),
        backgroundColor:appBarColor,
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
                          

                          RoundedContainer(
                            borderColor: kPinkCont,
                            item: 'CONFIRMED CASES',
                            data: snapshot.data[index].confirmed.toString(),
                            boxColor: bgColor,
                          ),
                          RoundedContainer(
                            borderColor: kYellowCont,
                            item: 'RECOVERED CASES',
                            data: snapshot.data[index].recovered.toString(),
                            boxColor: bgColor,
                          ),

                          RoundedContainer(
                            borderColor: kGreenCont,
                            item: 'Testings',
                            data: snapshot.data[index].tested.toString(),
                            boxColor: bgColor,
                          ),

                          RoundedContainer(
                            borderColor: kBlueCont,
                            item: 'Vaccinated',
                            data: snapshot.data[index].vaccinated.toString(),
                            boxColor: bgColor,
                          ),

                          RoundedContainer(
                            borderColor: kVioletCont,
                            item: 'Decreased',
                            data: snapshot.data[index].deceased.toString(),
                            boxColor: bgColor,
                          ),

                          TextButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
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
                                            ],
                                          ),
                                          actions: [
                                            // TextButton(
                                            //   onPressed: () => Navigator.pop(
                                            //       context, 'Cancel'),
                                            //   child: const Text('Cancel'),
                                            // ),
                                            TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'OK'),
                                                child: const Text('OK'))
                                          ],
                                        ));
                              },
                              child: Text(
                                'Click Here for  Vaccine Status',
                                style: TextStyle(color: textColor),
                              )),

                          // ElevatedButton(
                          //     onPressed: () {
                          //       // Navigator.push(
                          //       //     context,
                          //       //     MaterialPageRoute(
                          //       //         builder: (context) =>
                          //       //             UserSettings()));
                          //     },
                          //     child: Text('Settings'))
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
