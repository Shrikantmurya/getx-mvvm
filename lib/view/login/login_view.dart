import '/res/const_variable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/colors/app_color.dart';
import '../../res/components/adaptive/adaptive_screen.dart';
import '../../res/fonts/app_fonts.dart';
import '/res/components/round_button.dart';
import '/view/login/widgets/input_email_widget.dart';
import '/view/login/widgets/input_password_widget.dart';
import '/view_models/controller/login/login_view_model.dart';




class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final loginVM = Get.put(LoginViewModel()) ;
  final _formkey = GlobalKey<FormState>();
  List argumentData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: false,
        automaticallyImplyLeading:false,
        title: RawMaterialButton(
  onPressed:(){
    Navigator.pop(context);
  },
  elevation: 1.0,
  fillColor: AppColor.white,
 
  shape: const CircleBorder(),
  child: const Icon(
    Icons.arrow_back,
    size: 20.0,
  ),
),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: AdaptiveScreen(
    mobile:  SizedBox(
            width:  rWidth * 1,
            child: loginForm(),
          ),
    tablet: SizedBox(
            width:  rWidth * 0.4,
            child: loginForm(),
          ),
    web: SizedBox(
            width:  rWidth * 0.2,
            child: loginForm(),
          )
)
          
        ),
      ),
    );
  }

  loginForm(){
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                 'https://img.innerxcrm.com/logo/${argumentData[0]['logo']}',
                  width: 200,
                  height: 200,),
              Align(alignment: Alignment.centerLeft,
               child:Padding(
                 padding: const EdgeInsets.only(top: 20, bottom: 20),
                 child: Text('login'.tr,style: ThemeStyles.Size32TextStyleBlueW800),
               )),
        
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    InputEmailWidget(),
                    const SizedBox(height: 20,),
                    InputPasswordWidget(),
        
                  ],
                ),
              ),
        
              const SizedBox(height: 40,),
              Obx(() => RoundButton(
          width: rWidth * 1,
          title: 'login'.tr,
           rounded: 10,
          loading: loginVM.loading.value,
          iconEnable: false,
          onPress: (){
            if(_formkey.currentState!.validate()){
             
              loginVM.loginApi('innerxcrm_${argumentData[1]['database']}');
            }
          },
            ))
            ],
          ),
        );
  }
}
