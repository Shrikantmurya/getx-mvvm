import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/routes_name.dart';

List<Map<String, dynamic>> admindrawerMenus = [
 {
    "title": "Doc Upload",
    "icon": Icons.receipt,
    "subMenu": false,
    "event": () {
      Get.toNamed(
        RouteName.docUpload,
      );
    },
  },
  {
    "title": "notification",
    "icon": Icons.notifications,
    "subMenu": false,
    "event": () {
      Get.offAllNamed(RouteName.layoutView, arguments: 1);
    },
  },
  {
    "title": "SIM Request",
    "icon": Icons.sim_card,
    "subMenu": false,
    "event": () {
      Get.toNamed(
        RouteName.simReq,
      );
    },
  },
  {
    "title": "Message",
    "icon": Icons.sms,
    "subMenu": false,
    "event": () {
     Get.offAllNamed(RouteName.layoutView, arguments: 2);
    },
  },
  {
    "title": "Course Find",
    "icon": Icons.manage_search,
    "subMenu": false,
    "event": () {
      Get.toNamed(
        RouteName.coursefind,
      );
    },
  },
  {
    "title": "Add Interest",
    "icon": Icons.bookmark,
    "subMenu": false,
    "event": () {
      Get.toNamed(
        RouteName.addinterest,
      );
    },
  },
  {
    "title": "Form Request",
    "icon": Icons.receipt_long,
    "subMenu": false,
    "event": () {
      Get.toNamed(
        RouteName.formReq,
      );
    },
  },
  {
    "title": "AI Agent",
    "icon": Icons.portrait,
    "subMenu": false,
    "event": () {
      Get.toNamed(
        RouteName.aiAgent,
      );
    },
  },
  {
    "title": "New Services",
    "icon": Icons.miscellaneous_services,
    "subMenu": false,
    "event": () {
      Get.toNamed(
        RouteName.newservices,
      );
    },
  },
  {
    "title": "Upcomming Service",
    "icon": Icons.upcoming,
    "subMenu": false,
    "event": () {
      Get.toNamed(
        RouteName.upcomming,
      );
    },
  }

];
