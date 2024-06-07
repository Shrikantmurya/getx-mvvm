import 'dart:ui';
import '../../models/admin/admindashboard_list_model.dart';
import '/data/network/network_api_services.dart';
import '../../res/app_url/app_url.dart';

class AdmindashboardRepository {

  final _apiService  = NetworkApiServices() ;
  Future<AdmindashboardListModel> admindashboardListApi(data, appUrl) async{
    dynamic response = await _apiService.postApi(data, appUrl);
    return AdmindashboardListModel.fromJson(response) ;
  }
}
