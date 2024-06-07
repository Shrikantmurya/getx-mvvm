class UserModel {
  String? token, usertype, username, company;
  bool? isLogin ;

  UserModel({this.token , this.isLogin, this.usertype, this.username, this.company});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    isLogin = json['isLogin'];
    company = json['company'];
    usertype = json['usertype'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = token;
    data['isLogin'] = token;
    data['company'] = company;
    data['usertype'] = usertype;
    data['username'] = username;
    return data;
  }
}
