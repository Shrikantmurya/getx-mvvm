import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../assets/image_assets.dart';
import '../colors/app_color.dart';
import '../fonts/app_fonts.dart';
import 'adaptive/adaptive_screen.dart';

class WaveCardGridWidget extends StatefulWidget {
  const WaveCardGridWidget({super.key, required this.counselorList});
  final List<Map<String, dynamic>> counselorList;
  @override
  State<WaveCardGridWidget> createState() => _WaveCardGridWidgetState();
}

class _WaveCardGridWidgetState extends State<WaveCardGridWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: AdaptiveScreen(
          mobile: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.counselorList.length,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) {
                return cardwaveWidget(context, index);
              }),
          tablet: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            padding: EdgeInsets.all(10),
            children: List.generate(widget.counselorList.length, (index) {
              return cardwaveWidget(context, index);
            }),
          ),
          web: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            padding: EdgeInsets.all(10),
            children: List.generate(widget.counselorList.length, (index) {
              return cardwaveWidget(context, index);
            }),
          )),
    );
  }

  cardwaveWidget(context, index) {
    return GestureDetector(
      onTap: widget.counselorList[index]['event'],
      child: Container(
          margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage(widget.counselorList[index]['bgimage']),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 5, 0),
                    child: Text(
                      widget.counselorList[index]['label'],
                      style: ThemeStyles.Size18TextStyledarkBlueW400,
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 5, 0),
                    child: Text(
                      widget.counselorList[index]['count'].toString(),
                      style: ThemeStyles.size26TextStyleDarkBlueW700,
                    )),
              ]),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 5, 20, 5),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: AppColor.white,
                      child: SvgPicture.asset(
                        widget.counselorList[index]['image'],
                        width: 25,
                      ),
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
