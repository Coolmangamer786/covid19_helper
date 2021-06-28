import 'package:covid19_helper/pages/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColorLight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .8,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.shieldVirus,
                    color: Colors.white,
                    size: 70,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'COVID19',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    'HELPER',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),
                  )
                ],
              ),
            ),
            OutlinedButton(
              style: ButtonStyle(
                shape:
                    MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
                side: MaterialStateProperty.resolveWith<BorderSide>(
                    (Set<MaterialState> states) {
                  final Color color = states.contains(MaterialState.pressed)
                      ? Colors.pink
                      : Colors.white;
                  return BorderSide(color: color, width: 2);
                }),
              ),
              child: Text(
                'Get Started',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoadingScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
