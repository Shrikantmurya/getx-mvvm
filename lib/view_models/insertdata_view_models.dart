import './../models/msgdata_list_model.dart';
import 'package:get/get.dart';
import '../repository/insertdata_repository.dart';
import '../utils/utils.dart';
import '/data/response/status.dart';


class InsertDataController extends GetxController {
  final _api = InsertDataRepository();
  final rxRequestStatus = Status.LOADING.obs ;
  final userList = MsgData().obs ;
  RxString error = ''.obs;
   RxBool loading = false.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void setUserList(MsgData _value) => userList.value = _value ;
  void setError(String _value) => error.value = _value ;

  void insertdataListApi(data, apiUrl){
    setRxRequestStatus(Status.LOADING);
    _api.insertdataListApi(data, apiUrl).then((value){
      setRxRequestStatus(Status.COMPLETED);
       if (value.success == true) {
        Utils.snackBar(
            'Message', value.message.toString());
      } else {
        Utils.snackBar(
            'Message', value.message.toString());
      }
      loading.value = false;
      setUserList(value);
    }).onError((error, stackTrace){
      loading.value = false;
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }

}