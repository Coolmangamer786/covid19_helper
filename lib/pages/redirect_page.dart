import 'package:covid19_helper/controllers/resources_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class RedirectPage extends StatefulWidget {
  const RedirectPage({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  State<RedirectPage> createState() => _RedirectPageState();
}

class _RedirectPageState extends State<RedirectPage> {
  final ResourceController resourceController = Get.put(ResourceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.url,
            style: const TextStyle(
                fontFamily: "BebasNene", fontSize: 30, color: Colors.black)),
      ),
      body: Obx(() {
        return resourceController.isLoading.value == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: resourceController.productsList.length,
                itemBuilder: ((context, index) => ListTile(
                      title: Text(resourceController.productsList[index].name),
                      subtitle: const Text("Click to visit"),
                      onTap: () async {
                        String url = resourceController
                            .productsList[index].links
                            .toString();
                        print(url);
                        _launchURL(url);
                      },
                      // isThreeLine: true,
                    )));
      }),
    );
  }
}

void _launchURL(url) async {
  if (!await launch(url)) throw 'Could not launch $url';
}
