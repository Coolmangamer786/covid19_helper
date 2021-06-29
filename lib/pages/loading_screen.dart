
import 'package:covid19_helper/navigator_main.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key ?key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    Duration threeSec=Duration(seconds: 2);
    Future.delayed(threeSec,(){
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyStatefulWidget()));
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Center(
    child: SpinKitDoubleBounce(
      size: 100,
      color: Colors.pink,
      // color: Theme.of(context).accentColor,
    ),
      ),),
    );
  }
}