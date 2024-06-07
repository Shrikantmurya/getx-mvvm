import './../models/msgdata_list_model.dart';

import '/data/network/network_api_services.dart';
class InsertFileRepository {

  final _apiService  = NetworkApiServices() ;

  Future<MsgData> insertfileListApi(data, apiUrl) async{
    dynamic response = await _apiService.postAttachementApi(data, apiUrl);
    return MsgData.fromJson(response) ;
  }
}
