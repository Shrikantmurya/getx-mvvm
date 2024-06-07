 import 'package:flutter/material.dart';

class CardInfo extends StatefulWidget {
  const CardInfo({super.key,  this.height = 220, this.width = double.infinity,required this.bgColor, this.radius = 10,required this.text1,required this.text2,required this.image,required this.textStyle1,required this.textStyle2});
   final double height;
   final double width;
   final Color bgColor;
   final double radius;
   final String text1;
   final String text2;
   final String image;
   final TextStyle textStyle1;
   final TextStyle textStyle2;

  @override
  State<CardInfo> createState() => _CardInfoState();
}

class _CardInfoState extends State<CardInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(margin: const EdgeInsets.fromLTRB(10, 40, 10, 0),
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.radius), // Adjust the radius as needed
        color:widget.bgColor, // Container background color
      ),
      child:

      Container(margin: const EdgeInsets.all(10),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(children: [
              Padding(padding:const EdgeInsets.fromLTRB(10, 20, 5, 0),
                  child: Text(
                    widget.text1,
                    style: widget.textStyle1,
                  )),
              Padding(padding:const EdgeInsets.fromLTRB(10, 5, 5, 0),
                  child:  Text(
                    widget.text2,
                    style: widget.textStyle2,
                  )),
            ]),

              Container(
                width: 130,
                height: 130,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  color:Colors.white, 
                  ),
               child: Image.asset(widget.image)
) ],),
));
  }
}

class CardMarginBtn extends StatefulWidget {
  const CardMarginBtn({super.key,  this.buttonHeight = 60, required this.boxColor,required this.text,required this.textStyle, this.translateTop = true});
  final double buttonHeight;
  final Color boxColor;
  final String text;
  final TextStyle textStyle;
  final bool translateTop;

  @override
  State<CardMarginBtn> createState() => _CardMarginBtnState();
}

class _CardMarginBtnState extends State<CardMarginBtn> {
  @override
  Widget build(BuildContext context) {
    return Stack(
    children: [
      Container(height: widget.buttonHeight, color: Colors.white),
      Transform.translate(
        offset: Offset(0.0, -(widget.translateTop == true ? widget.buttonHeight : 0) / 2.0),
        child: Center(
          child: Container(
              height: widget.buttonHeight,
              decoration: BoxDecoration(
                color: widget.boxColor,
                borderRadius: BorderRadius.circular(widget.buttonHeight / 4.0),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 16.0,
                    offset: const Offset(0.0, 6.0),
                    color: Colors.black.withOpacity(0.16),
                  ),
                ],
              ),
              padding: const EdgeInsets.fromLTRB(94.0, 15.0, 24.0, 0.0),
              child: SizedBox(
                width: 150,
                child:  Text(
                    widget.text,
                    style: widget.textStyle
          
                ),
              )
          
          
          
          ),
        ),
      ),

    ],
  );
  }
}
