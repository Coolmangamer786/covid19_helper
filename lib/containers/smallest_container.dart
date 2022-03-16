import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SmallContainer extends StatelessWidget {
  const SmallContainer(
      {Key? key, required this.color, required this.url, required this.name})
      : super(key: key);
  final Color color;
  final String name, url;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Tapped");
        _launchURL(url);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * .15,
          decoration: BoxDecoration(
              color: color.withOpacity(0.4),
              borderRadius: BorderRadius.circular(16)),
          child: Center(
              child: Text(
            name,
            style:
                TextStyle(fontSize: 30, color: color, fontFamily: 'BebasNene'),
          )),
        ),
      ),
    );
  }
}

void _launchURL(url) async {
  if (!await launch(url)) throw 'Could not launch $url';
}
