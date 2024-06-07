

import 'package:get/get_state_manager/get_state_manager.dart';
import '/models/login/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {

    Future<bool> saveUser(UserModel responseModel)async{
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString('token', responseModel.token.toString());
      sp.setString('company', responseModel.company.toString());
      sp.setString('usertype', responseModel.usertype.toString());
      sp.setString('username', responseModel.username.toString());
      sp.setBool('isLogin', responseModel.isLogin!);

      return true ;
    }

    Future<UserModel> getUser()async{
      SharedPreferences sp = await SharedPreferences.getInstance();
      String? token = sp.getString('token');
      String? company = sp.getString('company');
      String? usertype = sp.getString('usertype');
      String? username = sp.getString('username');
      bool? isLogin = sp.getBool('isLogin');

      return UserModel(
        token: token ,
        isLogin: isLogin,
        company: company,
        usertype: usertype,
        username: username,
      ) ;
    }

    Future<bool> removeUser()async{
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.clear();
      sp.remove('token');
      sp.remove('company');
      sp.remove('usertype');
      sp.remove('username');
      sp.remove('isLogin');
      return true ;
    }
}