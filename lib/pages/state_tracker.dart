import 'package:covid19_helper/api_methods/api_methods.dart';
import 'package:covid19_helper/constants.dart';
import 'package:covid19_helper/containers/rounded_container.dart';
import 'package:covid19_helper/state_changer.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class StateTracker extends StatefulWidget {
  const StateTracker({Key? key}) : super(key: key);

  @override
  _StateTrackerState createState() => _StateTrackerState();
}

class _StateTrackerState extends State<StateTracker> {
  String stateSelected = '';

  @override
  void initState() {
    super.initState();

    stateSelected = StateNotifier.getStateName() ?? 'West Bengal';
  }

  List<String> stateName = [
    'Andaman and Nicobar',
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chandigarh',
    'Chhattisgarh',
    'Daman and Diu',
    'Delhi',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jammu and Kashmir',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Ladakh',
    'Lakshadweep',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Puducherry',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
  ];

  @override
  Widget build(BuildContext context) {
    final Color bgColor = Theme.of(context).accentColor == Colors.indigo
        ? kBlackBack
        : kSomewhatWhite;
    final Color textColor = Theme.of(context).accentColor == Colors.indigo
        ? kSomewhatWhite
        : kBlackBack;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          stateSelected,
          style: TextStyle(color: textColor),
        ),
        elevation: 0,
        backgroundColor: bgColor,
      ),
      body: Container(
        color: bgColor,
        child: FutureBuilder(
          future: getData(stateSelected),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                  child: Center(
                      child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(kPinkCont),
              )));
            } else {
              return ListView.builder(
                  physics: BouncingScrollPhysics(),
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
                          Container(
                            // decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButton(
                                style: TextStyle(color: textColor),
                                dropdownColor: bgColor,
                                underline: Container(
                                  color: textColor,
                                  height: 2,
                                ),
                                iconEnabledColor: textColor,
                                value: stateSelected,
                                onChanged: (newValue) {
                                  setState(() {
                                    this.stateSelected = newValue.toString();
                                    StateNotifier.setStateName(stateSelected);
                                  });
                                },
                                items: stateName.map((valueItem) {
                                  return DropdownMenuItem(
                                      child: Text(valueItem), value: valueItem);
                                }).toList(),
                              ),
                            ),
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
                                'Check Vaccine Status',
                                style: TextStyle(color: textColor),
                              )),

                          // ElevatedButton(
                          //     onPressed: () {
                          //       Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //               builder: (context) => ResourcesPage()));
                          //     },
                          //     child: Text('Resources'))
                        ],
                      ),
                    );
                  });
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.share),
      ),
    );
  }
}
