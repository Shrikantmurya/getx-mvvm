import 'package:flutter/material.dart';

import '../colors/app_color.dart';

customPopup(context, title, contentWidget, actionWidget, [double height = 0.7]){
   return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context)
          .modalBarrierDismissLabel,
      barrierColor: Color.fromARGB(90, 0, 0, 0),
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext,
          Animation animation,
          Animation secondaryAnimation) {
        return Center(
          child: Material(
            child: Container(
              width: MediaQuery.of(context).size.width * .9,
              height: MediaQuery.of(context).size.height * height,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              padding: const EdgeInsets.all(10),
              child:  SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // SizedBox(height: 20,),
                    Text(title, style: const TextStyle(fontSize: 16, color: AppColor.blackColor, fontWeight: FontWeight.w600, decoration: TextDecoration.none, height: 3),),
                    contentWidget,
                    actionWidget,
                  ],
                ),
              ),
            ),
          ),
        );
      });
  }