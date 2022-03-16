import 'package:covid19_helper/controllers/resources_name_controller.dart';
import 'package:covid19_helper/pages/redirect_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SmallContainerLite extends StatelessWidget {
  SmallContainerLite({
    Key? key,
    required this.small,
    required this.item,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);
  final String item, small;
  final IconData icon;
  final Color iconColor;

  final resourceName = Get.put(ResoursesNameController());
  void redirect() {
    resourceName.setUrl(small);
    Get.to(() => RedirectPage(url: item));
  }

  @override
  Widget build(BuildContext context) {
    var height1 = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => redirect(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: height1 < 640 ? 100 : 140,
          width: MediaQuery.of(context).size.width * 40 / 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                icon,
                size: height1 < 640 ? 30 : 50,
                color: iconColor,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                item.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: iconColor,
                    fontSize: height1 < 640 ? 16 : 22),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(.4),
            // border: Border.all(
            //   color: iconColor,
            //   width: 8,
            // ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
