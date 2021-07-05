import 'package:covid19_helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SmallContainer extends StatelessWidget {
  const SmallContainer({required this.item, required this.icon,required this.iconColor,});
  final String item;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    // final Color bgColor = Theme.of(context).accentColor == Colors.indigo
    //     ? kBlackBack
    //     : kSomewhatWhite;
    // final Color textColor = Theme.of(context).accentColor == Colors.indigo
    //     ? kSomewhatWhite
    //     : kBlackBack;
  var height1 = MediaQuery.of(context).size.height;
   
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height1<640?100:140,
        width: MediaQuery.of(context).size.width * 40 / 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              icon,
              size: height1<640?30:50,
              color:Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              item.toUpperCase(),
              textAlign: TextAlign.center,
              style: kSubHeadText.copyWith(color: Colors.white, fontSize: height1<640?16:20),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: iconColor,
          border: Border.all(
            color: iconColor,
            width: 8,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
