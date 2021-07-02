import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webpage extends StatelessWidget {
 Webpage({Key? key,required this.pageName,required this.pageUrl}) : super(key: key);
  final String pageName;
  final String pageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageName,
        ),
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: SafeArea(
        child: WebView(
          initialUrl: pageUrl,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
