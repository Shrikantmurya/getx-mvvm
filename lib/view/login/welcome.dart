import 'package:flutter/widgets.dart';

import '../../res/routes/routes_name.dart';
import '/res/const_variable.dart';
import '/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/assets/image_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/components/adaptive/adaptive_screen.dart';
import '../../res/components/btn.dart';
import '../../res/components/form_field.dart';
import '../../res/components/round_button.dart';
import '../../view_models/controller/login/student_view_model.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _formkey = GlobalKey<FormState>();
  final loginVM = Get.put(CompanyViewModel()) ;
  @override
  Widget build(BuildContext context) {
    //print( Utils.adapdiveScreen());
    return Scaffold(
        backgroundColor: AppColor.white,
        body: Center(
          child: AdaptiveScreen(
    mobile:  SizedBox(
            width:  rWidth * 1,
            child: welcomeWidget(),
          ),
    tablet: SizedBox(
            width:  rWidth * 0.4,
            child: welcomeWidget(),
          ),
    web: SizedBox(
            width:  rWidth * 0.2,
            child: welcomeWidget(),
          )
)
          
        )
    );
  }

  Stack welcomeWidget(){
    return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 100, bottom: 100),
                          child: Center(
                            child: Image.asset(ImageAssets.logofull,
                                width: 200,
                                ),
                          ),
                        ),
                        formFieldEmailPassWithoutIcon(                           
                                        maxLines: 1,
                                        obscureText: false,
                                        controller: companyNameController,
                                        keyboard: TextInputType.text,
                                        label: 'student_uid'.tr,
                                      ),  
                                      const SizedBox(height: 10,),
                                      Container(
                                margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                                child: 
                                Obx(() => RoundButton(
                                  width: 200,
                                  title: 'next'.tr,
                                  rounded: 10,
                                  iconEnable: true,
                                  loading: loginVM.loading.value,
                                  onPress: (){
                                    if(_formkey.currentState!.validate()){
                                       Map data = {'_action': 'login_id', 'id': companyNameController.text.toString()};
                                      loginVM.loginApi(data);
                                    }
                                  }
                              )   )  
                                      ),
                              GestureDetector(
                                child: Text('Skip', style: TextStyle(fontSize: 12, color: AppColor.lightBlue),),
                                 onTap: (){
                                  Get.toNamed( RouteName.layoutView);
                                 },
                                )  
                                     
                      ],
                    ),
                  ),
                ),
                // Image at the bottom
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Image.asset(ImageAssets.welcomeBg, fit: BoxFit.cover,),
                ),
              ],
            );
  }

  validate()
{

  print('company object test');
}
}