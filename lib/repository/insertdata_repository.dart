import './../models/msgdata_list_model.dart';

import '/data/network/network_api_services.dart';

class InsertDataRepository {

  final _apiService  = NetworkApiServices() ;

  Future<MsgData> insertdataListApi(data, apiUrl) async{
    dynamic response = await _apiService.postApi(data, apiUrl);
    return MsgData.fromJson(response) ;
  }
}
