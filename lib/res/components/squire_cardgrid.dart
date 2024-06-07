import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../assets/image_assets.dart';
import '../colors/app_color.dart';
import '../fonts/app_fonts.dart';
import 'adaptive/screen_init.dart';

class SquireCardGridWidget extends StatefulWidget {
  const SquireCardGridWidget({super.key, required this.counselorList});
  final List<Map<String, dynamic>> counselorList;
  @override
  State<SquireCardGridWidget> createState() => _SquireCardGridWidgetState();
}

class _SquireCardGridWidgetState extends State<SquireCardGridWidget> {
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
    return Material(
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: deviceType ? 6 : 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: EdgeInsets.all(10),
        children: List.generate(widget.counselorList.length, (index) {
          return GestureDetector(
            onTap: widget.counselorList[index]['event'],
            child: Container(
              decoration: BoxDecoration(
                color: widget.counselorList[index]['color'],
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColor.white,
                      child: SvgPicture.asset(widget.counselorList[index]['image'],
                      ),
                    ),
                  ),
                  Text(
                    widget.counselorList[index]['label'],
                    style: ThemeStyles.t21TextStyleDarkBlue500,
                  ),
                  Text(
                    widget.counselorList[index]['count'].toString(),
                    style: ThemeStyles.size26TextStyleDarkBlueW700,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
