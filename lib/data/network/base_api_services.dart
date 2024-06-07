
abstract class BaseApiServices {
  Future<dynamic> getApi(String url) ;
  Future<dynamic> postApi(dynamic data, String url) ;
  Future<dynamic> postAttachementApi(dynamic data, String url) ;
  Future<dynamic> putApi(dynamic data, String url) ;
  Future<dynamic> deletetApi(dynamic data, String url) ;
  Future<dynamic> postApiwithoutToken(dynamic data, String url) ;
  
}