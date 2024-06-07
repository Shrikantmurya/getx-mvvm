import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '/repository/login_repository/company_repository.dart';
import '/res/routes/routes_name.dart';
import '/utils/utils.dart';
import '/view_models/controller/user_preference/user_prefrence_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
class CompanyViewModel extends GetxController {

  final _api = CompanyRepository();

  UserPreference userPreference = UserPreference();

  final emailController = TextEditingController().obs ;
  final passwordController = TextEditingController().obs ;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;


  void loginApi(data){
    loading.value = true ;

    _api.companyApi(data).then((value) async {
  
      loading.value = false ;

      if(value['msg'] == 'success'){
          //save logo in local db
         SharedPreferences sp = await SharedPreferences.getInstance();
         sp.setString('logo', value['data']['logo'].toString());
         Utils.snackBar(value['data']['sub_domain'], value['msg']);
         Get.toNamed(RouteName.loginView, arguments: [
    {"logo": value['data']['logo'] },
    {"database": value['data']['sub_domain'] }
]);
        
      }else {
        Utils.snackBar('UID','Student Not Exist');
      
      }
    }).onError((error, stackTrace){
      loading.value = false ;
      Utils.snackBar('Error', error.toString());
    });
  }
}