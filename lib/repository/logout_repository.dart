import '/data/network/network_api_services.dart';
import '../res/app_url/app_url.dart';

class LogoutRepository {

  final _apiService  = NetworkApiServices() ;


  Future<dynamic> logoutApi() async{
    dynamic response = await _apiService.getApi(AppUrl.logoutApi);
    return response ;
  }



}