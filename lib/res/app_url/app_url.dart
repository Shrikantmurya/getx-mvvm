class Envirnment {
  //setup project envirment here
  static String production() {
    return 'http://3.128.2.255:3000';
  }

  static String testing() {
    return 'http://3.128.2.255:3000';
  }
}

class AppUrl extends Envirnment {
  static String baseUrl = Envirnment.testing().toString();
  static String loginApi = '$baseUrl/login';
  static String studntuidApi = 'https://api.innerxcrm.com/v1/';
  static String logoutApi = '$baseUrl/api/logout?';
  static String admindashboardListApi = '$baseUrl/api/admindashboard';
}
