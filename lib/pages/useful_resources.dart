import 'package:covid19_helper/api_methods/api_methods.dart';
import 'package:covid19_helper/api_methods/model.dart';
import 'package:covid19_helper/webpage/webpage.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

class RedirectedPage extends StatefulWidget {
  RedirectedPage({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  _RedirectedPageState createState() => _RedirectedPageState();
}

class _RedirectedPageState extends State<RedirectedPage> {
  void _launchURL(url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  @override
  Widget build(BuildContext context) {
    final Color bgColor =
        Theme.of(context).accentColor == KTealLight ? kBlackBack : kPinkCont;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        backgroundColor: bgColor,
      ),
      body: FutureBuilder<List<Resources>>(
        future: ResourcesApi.getResources(context, widget.name),
        builder: (context, snapshot) {
          final users = snapshot.data;

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              if ((snapshot.hasError)) {
                return Center(
                  child: Text('Something fishy'),
                );
              } else {
                return buildChart(users!);
              }
          }
        },
      ),
    );
  }

  Widget buildChart(List<Resources> users) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];

          return ListTile(
            onTap: () {
              print('Being tapped ${user.name}');
              if (widget.name == 'Whatsapp' || widget.name == 'Telegram') {
                print('insid wp or tele');
                _launchURL(user.links);
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Webpage(pageName: user.name, pageUrl: user.links)));
              }
            },
            title: Text(user.name),
            subtitle: Text('Click here to visit'),
            // leading: Text('${index+1}'.toString()),
            trailing: IconButton(
              icon: FaIcon(FontAwesomeIcons.shareSquare),
              onPressed: () {
                Share.share(
                    '📌 For ${widget.name} \n🔥 Visit : ${user.name}\n⚡ link : ${user.links} \n\n 🎯 For more download the app today. https://play.google.com');
              },
            ),
          );
        });
  }
}
