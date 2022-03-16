import 'package:flutter/material.dart';

class AnotherContainer extends StatelessWidget {
  const AnotherContainer(
      {Key? key,
      required this.color,
      required this.event,
      required this.data,
      required this.today})
      : super(key: key);
  final Color color;
  final String event, data, today;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .15,
        decoration: BoxDecoration(
            color: color.withOpacity(0.4),
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "$event :",
              style: TextStyle(
                  fontSize: 30, color: color, fontFamily: 'BebasNene'),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data,
                  style: TextStyle(
                      fontSize: 20, color: color, fontFamily: 'BebasNene'),
                ),
                Text(
                  "+ $today",
                  style: TextStyle(
                      fontSize: 15, color: color, fontFamily: 'BebasNene'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
