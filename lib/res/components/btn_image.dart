import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BtnImage extends StatefulWidget {
  const BtnImage({super.key, required this.svgImg,  this.label = '', required this.width,});
  final String svgImg;
  final String label;
  final double width;

  @override
  State<BtnImage> createState() => _BtnImageState();
}

class _BtnImageState extends State<BtnImage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
     SvgPicture.asset(widget.svgImg,
        width: widget.width,
      ),
       Text(widget.label, style: TextStyle(fontSize: 12),)                
    ],);
  }
}