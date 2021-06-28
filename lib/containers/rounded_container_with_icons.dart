import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';


class RoundedContainer2 extends StatelessWidget {
  const RoundedContainer2({Key? key,required this .boxColor,required this .borderColor, required this.icon, required this.title}) : super(key: key);
  final Color boxColor;
  final Color borderColor;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: boxColor,
          border: Border.all(
            color: borderColor,
            width: 8,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        height: 85,
        // width: MediaQuery.of(context).size.width * .8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [
                FaIcon(icon,color: borderColor,),

                SizedBox(
                  width: 5,
                ),
                Text(
                  title,
                  style: GoogleFonts.bebasNeue(
                      textStyle: kContTextStyle.copyWith(color: borderColor)),
                )
              ],
            ),
          ],
        ),
    );
  }
}