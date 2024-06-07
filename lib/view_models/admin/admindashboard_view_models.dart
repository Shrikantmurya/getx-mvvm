import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/admin/admindashboard_list_model.dart';
import '../../repository/admin/admindashboard_repository.dart';
import '../../res/const_variable.dart';
import '/data/response/status.dart';

class AdmindashboardController extends GetxController {
  final _api = AdmindashboardRepository();
  final rxRequestStatus = Status.LOADING.obs ;
  final userList = AdmindashboardListModel().obs ;
  RxString error = ''.obs;
  RxBool loading = false.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void setUserList(AdmindashboardListModel _value) => userList.value = _value ;
  void setError(String _value) => error.value = _value ;


  Future<dynamic> admindashboardListApi(data, appUrl) async {
    setRxRequestStatus(Status.LOADING);
    loading.value = true;
    _api.admindashboardListApi(data, appUrl).then((value){
      profileImageUrl.value = value.data.pofileUrl.toString();
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
       loading.value = false;
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
       loading.value = false;
    });
  }

}