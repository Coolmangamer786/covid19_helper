import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer(
      {required this.boxColor,
      required this.borderColor,
      required this.item,
      required this.data,
      });
  final Color boxColor;
  final Color borderColor;
  final String item;
  final String data;

  @override
  Widget build(BuildContext context) {
    if (data == '0') {
      return Container();
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: boxColor,
          border: Border.all(
            color: borderColor,
            width: 8,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        height: 75,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  item,
                  style: GoogleFonts.bebasNeue(
                      textStyle: kContTextStyle.copyWith(color: borderColor)),
                ),
                Text(
                  data,
                  style: GoogleFonts.bebasNeue(
                      textStyle: kContTextStyle.copyWith(color: borderColor)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
