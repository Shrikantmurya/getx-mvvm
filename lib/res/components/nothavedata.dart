
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../assets/image_assets.dart';
import '../colors/app_color.dart';
import 'animation/shake.dart';

class NotData extends StatefulWidget {
  const NotData({super.key});

  @override
  State<NotData> createState() => _NotDataState();
}

class _NotDataState extends State<NotData>  with TickerProviderStateMixin {
    late AnimationController _controllerLogo;
    late Animation<Color?> _colorAnimation;
  late Animation<double> _animationLogo;
 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllerLogo = AnimationController(vsync: this, duration: Duration(seconds: 4));
    _animationLogo = Tween<double>(begin: 0, end: 150,).animate( CurvedAnimation( parent: _controllerLogo, curve: Curves.ease,),);
    _controllerLogo.forward();
     _colorAnimation = ColorTween(
      begin: Colors.white,
      end:  AppColor.blueLight,
    ).animate(_controllerLogo);
  }

  @override
  Widget build(BuildContext context) {
    return  AnimatedBuilder(
        animation: _controllerLogo,
        builder: (BuildContext context, __) {
           return  Center(
      child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Shake(
              shakeWidget: SvgPicture.asset( ImageAssets.nodataIcn, height: _animationLogo.value, width: _animationLogo.value,
              ),
            )),
    ) ;
        },
    );
    

  }
}
