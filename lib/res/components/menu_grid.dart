import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'btn_image.dart';

class MenuGrid extends StatefulWidget {
  const MenuGrid({super.key, required this.GridMenus});
  final List GridMenus;
  @override
  State<MenuGrid> createState() => _MenuGridState();
}

class _MenuGridState extends State<MenuGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
                shrinkWrap: true,
                physics:NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  padding: EdgeInsets.all(0),
                  children: List.generate(widget.GridMenus.length, (index) {
                    return GestureDetector(
                      onTap: widget.GridMenus[index]['event'] ?? '',
                      child: Center(
                        child:  Hero(tag: 'gic-request',
                        child: BtnImage(svgImg: widget.GridMenus[index]['image'] ?? '',label: widget.GridMenus[index]['label'] ?? '', width: widget.GridMenus[index]['width'] ?? 0)),
                      ),
                    );
                  }),
                );
  }
}