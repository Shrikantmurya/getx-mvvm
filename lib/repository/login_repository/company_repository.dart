

import 'dart:ui';

import '/data/network/network_api_services.dart';
import '../../res/app_url/app_url.dart';

class CompanyRepository {

  final _apiService  = NetworkApiServices() ;


  Future<dynamic> companyApi(var data) async{
    dynamic response = await _apiService.postApiwithoutToken(data, AppUrl.studntuidApi);
    return response ;
  }



}