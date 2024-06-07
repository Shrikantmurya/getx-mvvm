import 'dart:async';
import 'dart:io';

import '/res/const_variable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../res/assets/image_assets.dart';
import '../res/components/adaptive/screen_init.dart';
import '/res/colors/app_color.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';  
import 'package:path_provider/path_provider.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
  
  //get extention name to url
  static String getFileExtension(String url) {
  int dotIndex = url.lastIndexOf('.');
  if (dotIndex != -1) {
    return url.substring(dotIndex);
  }
  return ''; 
}

 //get filename from url
  static String getFilenameFromUrl(String url) {
  List<String> parts = url.split('/');

   int dotIndex = parts.last.lastIndexOf('.');
  return dotIndex != -1 ? parts.last.substring(0, dotIndex) : parts.last;
} 

  //get greating msg
  static getGreetingMessage() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning!';
    } else if (hour < 18) {
      return 'Good Afternoon!';
    } else {
      return 'Good Evening!';
    }
  }

//curency change
  static String formatAmount(double amount) {
    if (amount >= 10000000) {
      return (amount / 10000000).toStringAsFixed(1) + 'Cr';
    } else if (amount >= 100000) {
      return (amount / 100000).toStringAsFixed(1) + 'L';
    } else if (amount >= 1000) {
      return (amount / 1000).toStringAsFixed(1) + 'k';
    } else {
      return amount.toStringAsFixed(1);
    }
  }


  static getddmmyy(data) {
    return DateFormat('dd-MM-yyyy').format(DateTime.parse(data));
  }

  static getCurrentMonth() {
    DateTime now = DateTime.now();
    String currentMonth = DateFormat.MMM().format(now);
    return currentMonth;
  }
 //device type desktop and mobile
 static desktopEnable(){
   late bool deviceType;
    final responsiveScreen = MediaQueryData.fromView(WidgetsBinding.instance.window).size;
    var screenWidth = responsiveScreen.width;
    if (screenWidth > ScreenInit.webBreakPoint) {
      deviceType = true;
    } else {
      deviceType = false;
    }
  return deviceType;
 }
  static snackBar(String title, String message) {
    late bool deviceType;
    final responsiveScreen = MediaQueryData.fromView(WidgetsBinding.instance.window).size;
    var screenWidth = responsiveScreen.width;
    if (screenWidth > ScreenInit.webBreakPoint) {
      deviceType = true;
    } else {
      deviceType = false;
    }
    Get.snackbar(title, message,
        maxWidth: deviceType ? rWidth * 0.2 : rWidth * 1,
        colorText: AppColor.white,
        snackPosition: SnackPosition.BOTTOM,
        icon: Padding(
          padding: const EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              ImageAssets.icon,
            ),
          ),
        ),
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        margin: const EdgeInsets.only(bottom: 30),
        backgroundColor: AppColor.blackColor,
        borderRadius: 100);
  }
  
  //any type of file downloader
  static downloadFile(String fileUrl) async {
    try {
     
      final response = await http.get(Uri.parse(fileUrl));
      if (response.statusCode == 200) {
       Directory? storagePath;

        //platform detect for storage permission
         if (Platform.isAndroid) {
            storagePath = await DownloadsPathProvider.downloadsDirectory;
            
        } else if (Platform.isIOS) {
          storagePath = await getApplicationDocumentsDirectory();
          
        } 
     
        final file = File('${storagePath!.path}/${Utils.getFilenameFromUrl(fileUrl)}${Utils.getFileExtension(fileUrl)}');
        await file.writeAsBytes(response.bodyBytes);
        Get.dialog(
              AlertDialog(
                title: Text('File Saved'),
                content: Text('Location: ${file.path}'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back(); // Dismiss the dialog
                    },
                    child: Text('OK'),
                  ),
                ],
              ),
            );   
      } else {
        throw Exception('Failed to download file: ${response.statusCode}');
      }
    } catch (e) {
      
      Utils.snackBar(
            'File Saved', e.toString());
     
    }
  }
  //open file
  static openFile(String fileUrl) async {
    if (await canLaunch(fileUrl)) {
      await launch(
        fileUrl,
        forceWebView: true,
      );
    }
  }
 
 
}
