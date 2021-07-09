
import 'package:covid19_helper/ads/adstate.dart';
import 'package:covid19_helper/api_methods/api_methods.dart';
import 'package:covid19_helper/constants.dart';
import 'package:covid19_helper/containers/rounded_container.dart';
import 'package:covid19_helper/state_changer.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';

class StateTracker extends StatefulWidget {
  const StateTracker({Key? key}) : super(key: key);

  @override
  _StateTrackerState createState() => _StateTrackerState();
}

class _StateTrackerState extends State<StateTracker> {
  GlobalKey _six = GlobalKey();
  GlobalKey _seven = GlobalKey();
  GlobalKey _eight = GlobalKey();
  GlobalKey _nine = GlobalKey();
  GlobalKey _ten = GlobalKey();


  String stateSelected = '';
  late int vacc, recc, test = 0, con = 0, dec = 0, d1 = 0, d2 = 0;
  var today = DateTime.now();
  @override
  void initState() {
    super.initState();
    stateSelected = StateNotifier.getStateName() ?? 'West Bengal';
    //  WidgetsBinding.instance!.addPostFrameCallback(
    //   (_) => ShowCaseWidget.of(context)!.startShowCase([
    //     _six,_seven,_eight,_nine,_ten
    //   ]),
    // );
  
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
late BannerAd banner;

  @override
  void didChangeDependencies() {

    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initialization.then((status) {
      setState(() {
        banner = BannerAd(
            size: AdSize.banner,
            adUnitId: adState.bannerAdUnitId,
            listener: adState.listener,
            request: AdRequest())
            ..load();
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    final Color bgColor = Theme.of(context).accentColor == KTealLight
        ? kBlackBack
        : kSomewhatWhite;
    final Color textColor = Theme.of(context).accentColor == KTealLight
        ? kSomewhatWhite
        : kBlackBack;

    SharedPreferences preferences;



    displayShowcase() async {
      preferences = await SharedPreferences.getInstance();
      bool? showcaseVisibilityStatus = preferences.getBool("showShowcase3");
      if (showcaseVisibilityStatus == null) {
        preferences.setBool("showShowcase3", false).then((bool success) {
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
            .startShowCase([_six, _seven, _eight, _nine, _ten]);
      }
    });

    

    showVaccineStatus(int dose1, int dose2, int total) {
      return showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
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
                          dose1.toString(),
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
                          dose2.toString(),
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
                          total.toString(),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Take Your Vaccine 💉 soon cause it free and it is also effective ⚡ for fighting against the Virus 👿.',
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'))
                ],
              ));
    }

    displayMore(
      String topic,
      int data,
      String desc,
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
        automaticallyImplyLeading: false,
        title:Showcase(
          key: _six,
          description: 'Click Here To Change State',
          child: DropdownButton(
            isExpanded: true,
            style: TextStyle(color: textColor,fontSize: 20,fontWeight: FontWeight.w500),
            dropdownColor: bgColor,
            underline: SizedBox(height: 0,
            ),
icon: FaIcon(FontAwesomeIcons.caretDown),
            iconEnabledColor: textColor,
            value: stateSelected,
            onChanged: (newValue) {
              setState(() {
                this.stateSelected =
                    newValue.toString();
                StateNotifier.setStateName(
                    stateSelected);
              });
            },
            items: stateName.map((valueItem) {
              return DropdownMenuItem(
                  child: Text(valueItem),
                  value: valueItem);
            }).toList(),
          ),
        ),

        // Text(
        //   stateSelected,
        //   style: TextStyle(color: textColor),
        // ),
        elevation: 0,
        backgroundColor: bgColor,
        actions: [


          Showcase(
            key: _eight,
            description: 'Click here for vaccine status',
            child: IconButton(
              onPressed: () {
                showVaccineStatus(d1, d2, vacc);
              },
              icon: FaIcon(FontAwesomeIcons.syringe),
              color: textColor,
            ),
          ),
          // IconButton(
          //   onPressed: () {
          //     showDialog(
          //         context: context,
          //         builder: (context) {
          //           return AlertDialog(
          //             title: Text('How to use'),
          //             content: Column(
          //               mainAxisSize: MainAxisSize.min,
          //               children: [
          //                 Text(
          //                   '📌 Click on  -\n🎯 Confiremed,\n🎯 Recovered,\n🎯 Testings,\n🎯 Decreased \nfor more info.\n\nAnd click 💉 Vaccinated for Vaccine Status.\n\nChange State using the Dropdown Menu 🔻 \n\nClick on 😎 Share Button to share the data with others.',
          //                   textAlign: TextAlign.left,
          //                 ),
          //               ],
          //             ),
          //             actions: [
          //               TextButton(
          //                   onPressed: () {
          //                     Navigator.pop(context);
          //                   },
          //                   child: Text('ok'))
          //             ],
          //           );
          //         });
          //   },
          //   icon: FaIcon(
          //     FontAwesomeIcons.infoCircle,
          //     color: textColor,
          //
          //   ),
          // ),
        ],
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
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: snapshot.data.length ,
                        itemBuilder: (BuildContext context, int index) {
                           {
                            return ListTile(
                              tileColor: Colors.black,
                              title: Showcase(
                                key: _nine,
                                description:
                                    'Tap in Conmiremd,Recovered,Testings,Vaccinated,Decreased for detailed info',
                                child: Column(
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
                                            'Please be Stay Safe 🔒 and get Vaccinated 💉 as soon as possible.');
                                      },
                                      child: RoundedContainer(
                                        borderColor: kPinkCont,
                                        item: 'CONFIRMED CASES',
                                        data:
                                            snapshot.data[index].confirmed.toString(),
                                        boxColor: bgColor,
                                      ),
                                    ),
                  
                                    GestureDetector(
                                      onTap: () {
                                        displayMore(
                                            'Recovered Cases',
                                            snapshot.data[index].recovered,
                                            'Never loose hope we can always get Recovered 💝 Stay Strong 💪 we will fight together against the Virus 👿.');
                                      },
                                      child: RoundedContainer(
                                        borderColor: kYellowCont,
                                        item: 'RECOVERED CASES',
                                        data:
                                            snapshot.data[index].recovered.toString(),
                                        boxColor: bgColor,
                                      ),
                                    ),
                  
                                    GestureDetector(
                                      onTap: () {
                                        displayMore(
                                            'Testings Done',
                                            snapshot.data[index].tested,
                                            'For Testings please TESTING 🔥 visit  on Resources 🐻.');
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
                                        showVaccineStatus(
                                            snapshot.data[index].dose1,
                                            snapshot.data[index].dose2,
                                            snapshot.data[index].vaccinated);
                                      },
                                      child: RoundedContainer(
                                        borderColor: kBlueCont,
                                        item: 'Vaccinated',
                                        data: snapshot.data[index].vaccinated
                                            .toString(),
                                        boxColor: bgColor,
                                      ),
                                    ),
                  
                                    GestureDetector(
                                      onTap: () {
                                        displayMore(
                                            'Deaths',
                                            snapshot.data[index].deceased,
                                            'We have lost lot of peoples in our surrounding,Please be Safe 🔒 and Take Safety precautions');
                                      },
                                      child: RoundedContainer(
                                        borderColor: kVioletCont,
                                        item: 'Decreased',
                                        data:
                                            snapshot.data[index].deceased.toString(),
                                        boxColor: bgColor,
                                      ),
                                    ),
                                    shareData(
                                        snapshot.data[index].confirmed,
                                        snapshot.data[index].recovered,
                                        snapshot.data[index].tested,
                                        snapshot.data[index].vaccinated,
                                        snapshot.data[index].dose1,
                                        snapshot.data[index].dose2,
                                        snapshot.data[index].deceased),

                                  ],
                                ),
                              ),
                            );
                          }
                        }),
                  ),

                      Container(
                    color: bgColor,
                    height: 50,
                    child: AdWidget(
                      ad: banner,
                    ),
                  ),

                ],
              );
            }
          },
        ),
      ),
      floatingActionButton: Showcase(
        key: _seven,
        description: 'Share Data with others',
        child: FloatingActionButton(
          onPressed: () {
            String conDes = con == 0 ? '' : '\n😷 Confirmed Cases  : $con';
            String recDes = recc == 0 ? '' : '\n💝 Recovered Cases : $recc';

            String testDec = test == 0 ? '' : '\n🔥 Testings Done : $test ';
            String vacDec = vacc == 0 ? '' : '\n💉 Vaccinated : $vacc ';
            String decDes = dec == 0 ? '' : '\n👼 Deaths : $dec ';

            Share.share(
                '📌 In $stateSelected \n$conDes $recDes $testDec $vacDec $decDes \n\n🙏 Stay Safe and take safety precautions. \n🎯 For more download the app today. https://bit.ly/3hqlbtV',
                subject: 'Latest Covid Data of $stateSelected');
            print(
                'Conf : ${con.toString()}, \n Rec: ${recc.toString()},${test.toString()},${vacc.toString()},${d1.toString()},${d2.toString()},${dec.toString()}');
          },
          child: FaIcon(FontAwesomeIcons.shareSquare),
        ),
      ),
    );
  }

  shareData(int confirmed, int recovered, int tests, int vaccinated, int dose1,
      int dose2, int decrease) {
    con = confirmed;
    recc = recovered;
    test = tests;
    vacc = vaccinated;
    d1 = dose1;
    d2 = dose2;
    dec = decrease;
    return SizedBox();
  }



}
