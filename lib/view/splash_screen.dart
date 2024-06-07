import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../res/assets/image_assets.dart';
import '../res/colors/app_color.dart';
import '/view_models/services/splash_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  with TickerProviderStateMixin {
  late AnimationController _controllerLogo;
  late Animation<double> _animationLogo;
  late Animation<Color?> _colorAnimation;
  late String logo = '';
  SplashServices splashScreen = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLogo();
    splashScreen.isLogin();
    _controllerLogo = AnimationController(vsync: this, duration: Duration(seconds: 4));
    _animationLogo = Tween<double>(begin: 300, end: 120,).animate( CurvedAnimation( parent: _controllerLogo, curve: Curves.ease,),);
    _controllerLogo.forward();
    //animationColor
    _colorAnimation = ColorTween(
      begin: AppColor.blueLight,
      end: Colors.white,
    ).animate(_controllerLogo);



  }

  getLogo() async {
      SharedPreferences sp = await SharedPreferences.getInstance();
      setState(() {
        logo = sp.getString('logo')!;
      });
   }

  @override
  Widget build(BuildContext context) {
    return  AnimatedBuilder(
        animation: _controllerLogo,
        builder: (BuildContext context, __) {
           return Scaffold(
            backgroundColor: _colorAnimation.value,
            body: Center(
              child: logo.isNotEmpty ?  Image.network(
                      'https://img.innerxcrm.com/logo/${logo}',
                      height: 30,
                      width:  _animationLogo.value
                    ) 
                    : 
                    Image.asset(ImageAssets.logofull, width:  _animationLogo.value,
              )),
           );
        },
    );
    
  }

   @override
  void dispose() {
    _controllerLogo.dispose();
    super.dispose();
  }
}

