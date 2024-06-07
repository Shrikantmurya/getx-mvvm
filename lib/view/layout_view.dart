import 'dart:io';

import '/res/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../res/assets/image_assets.dart';
import '../res/components/adaptive/screen_init.dart';

import 'student_dashboard/msg_view.dart';
import 'student_dashboard/notification_view.dart';
import 'student_dashboard/profile_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'student_dashboard/home_view.dart';

class AdminLayout extends StatefulWidget {
  const AdminLayout({Key? key}) : super(key: key);

  @override
  _AdminLayoutState createState() => _AdminLayoutState();
}

class _AdminLayoutState extends State<AdminLayout> {
  int pageIndex = Get.arguments ?? 0;

  final pages = [
    const HomeScreen(),
    const NotiScreen(),
    const MsgScreen(),
    const ProfileScreen(),
    const Text('tab 5'),
  ];

  Future<bool> showExitPopup(context) async {
    exit(0);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  
  @override
  Widget build(BuildContext context) {
     late bool deviceType;
    final responsiveScreen = MediaQuery.of(context).size;
    var screenWidth = responsiveScreen.width;
    if (screenWidth > ScreenInit.webBreakPoint) {
      deviceType = true;
    } else {
      deviceType = false;
    }
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        body: pages[pageIndex],
        bottomNavigationBar: deviceType ? Visibility(visible: false, child: buildMyNavBar(context)) :  Visibility(visible: true, child: buildMyNavBar(context)),
      ),
    );
  }

  buildMyNavBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        decoration:  BoxDecoration(
          color: AppColor.white,
           border: Border.all(width: 1, color: const Color.fromARGB(255, 216, 216, 216)),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: pageIndex == 0
                  ? SvgPicture.asset(
                      ImageAssets.home,
                      color: AppColor.blueLight,
                    )
                  : SvgPicture.asset(
                      ImageAssets.home,
                       color: AppColor.greyColor,
                    ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: pageIndex == 1
                  ? SvgPicture.asset(
                      ImageAssets.lead,
                      color: AppColor.blueLight,
                    )
                  : SvgPicture.asset(
                      ImageAssets.lead,
                      color: AppColor.greyColor,
                    ),
            ),
              IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon: pageIndex == 2
                  ? SvgPicture.asset(
                      ImageAssets.messageNoti,
                      color: AppColor.blueLight,
                       width: 25,
                       height: 25,
                    )
                  : SvgPicture.asset(
                      ImageAssets.messageNoti,
                      color: AppColor.greyColor,
                       width: 25,
                       height: 25,
                    ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 3;
                });
              },
              icon: pageIndex == 3
                  ? SvgPicture.asset(
                      ImageAssets.user,
                      color: AppColor.blueLight,
                    )
                  : SvgPicture.asset(
                      ImageAssets.user,
                      color: AppColor.greyColor,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
