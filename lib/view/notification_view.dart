import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../res/assets/image_assets.dart';
import '../res/colors/app_color.dart';
import '../res/components/wave_cardgrid.dart';
import '../res/const_variable.dart';
import '../res/fonts/app_fonts.dart';
import '../res/routes/routes_name.dart';

class Notification extends StatefulWidget {
  const Notification({super.key});

  @override
  State<Notification> createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  var appData = Get.arguments;
  @override
  Widget build(BuildContext context) {
    RxInt tabSelected = 1.obs;
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Notifications",
            style: ThemeStyles.t18TextStyleBlackColorW700,
          ),
          leading: Padding(
            padding: const EdgeInsets.all(7.0),
            child: RawMaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              padding: const EdgeInsets.all(0),
              elevation: 1.0,
              fillColor: AppColor.white,
              shape: const CircleBorder(),
              child: SvgPicture.asset(
                ImageAssets.backarrow,
              ),
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Image.network(
                profileImageUrl.value,
                height: 50,
                width: 50,
              ),
              iconSize: 50,
              onPressed: () {
                //arguent for laout page load
                Get.toNamed(RouteName.layoutView, arguments: 3);
              },
            )
          ],
        ),
        body: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.directions_car)),
                  Tab(icon: Icon(Icons.directions_transit)),
                  Tab(icon: Icon(Icons.directions_bike)),
                ],
              ),
              title: const Text('Tabs Demo'),
            ),
            body: const TabBarView(
              children: [
                Icon(Icons.directions_car),
                Icon(Icons.directions_transit),
                Icon(Icons.directions_bike),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
