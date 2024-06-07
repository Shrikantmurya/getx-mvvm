import 'package:get/get.dart';
import '../models/msgdata_list_model.dart';
import '../repository/insertfile_repository.dart';
import '../utils/utils.dart';
import '/data/response/status.dart';


class InsertFileController extends GetxController {
  final _api = InsertFileRepository();
  final rxRequestStatus = Status.LOADING.obs ;
  final userList = MsgData().obs ;
  RxString error = ''.obs;
  RxBool loading = false.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void setUserList(MsgData _value) => userList.value = _value ;
  void setError(String _value) => error.value = _value ;

  Future<dynamic> insertfileListApi(data, apiUrl) async{
    loading.value = true;
    setRxRequestStatus(Status.LOADING);
    _api.insertfileListApi(data, apiUrl).then((value){
       if (value.success == true) {
        Utils.snackBar(
            'Message', value.message.toString());
      } else {
        Utils.snackBar(
            'Message', value.message.toString());
      }
      loading.value = false;
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace){
      loading.value = false;
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }

}