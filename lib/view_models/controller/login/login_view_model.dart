import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '/models/login/user_model.dart';
import '/repository/login_repository/login_repository.dart';
import '/res/routes/routes_name.dart';
import '/utils/utils.dart';
import '/view_models/controller/user_preference/user_prefrence_view_model.dart';

class LoginViewModel extends GetxController {

  final _api = LoginRepository();

  UserPreference userPreference = UserPreference();

  final emailController = TextEditingController().obs ;
  final passwordController = TextEditingController().obs ;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;


  void loginApi(databaseName){
    loading.value = true ;
    Map data = {
     
      "mobile":emailController.value.text.toString(),
      "password":passwordController.value.text.toString(),
      "dbname":databaseName.toString()
  
    };
    _api.loginApi(json.encode(data)).then((value){
      loading.value = false ;
      if(value['success'] == false){
        Utils.snackBar('Login', value['message']);
      }else {

        UserModel userModel = UserModel(
            token: value['user']['apiToken'] ,
            username: value['user']['mobile'],
            isLogin: true
        );

        userPreference.saveUser(userModel).then((value){

          // releasing resouces because we are not going to use this
          Get.delete<LoginViewModel>();
          Get.toNamed(RouteName.layoutView);
           
        }).onError((error, stackTrace){

        });


      }
    }).onError((error, stackTrace){
      loading.value = false ;
      Utils.snackBar('Error', error.toString());
    });
  }
}