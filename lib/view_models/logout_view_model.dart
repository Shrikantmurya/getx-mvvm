import 'dart:async';

import './../repository/logout_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../res/routes/routes_name.dart';
import '/utils/utils.dart';
import '/view_models/controller/user_preference/user_prefrence_view_model.dart';

class LogoutViewModel extends GetxController {

  final _api = LogoutRepository();

  UserPreference userPreference = UserPreference();

  final emailController = TextEditingController().obs ;
  final passwordController = TextEditingController().obs ;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  Future<void> logoutApi() async {
    loading.value = true ;

    _api.logoutApi().then((value){
      loading.value = false ;
      if(value['success'] == true){
         UserPreference().removeUser().then((e) => {
                    Utils.snackBar('Logout', value['message']),
                    Timer(const Duration(seconds: 3) , () => Get.toNamed(RouteName.welcomeView) )
                    });
        
      }else {
        Utils.snackBar('Logout', value['message']);
      }
    }).onError((error, stackTrace){
      loading.value = false ;
      Utils.snackBar('Error', error.toString());
    });
  }
}