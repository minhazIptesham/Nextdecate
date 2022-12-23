
class UserInfoModel {
  String? authStatus;
  String? userId;
  String? token;

  UserInfoModel({this.authStatus, this.userId, this.token});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    authStatus = json['auth_status'];
    userId = json['user_id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['auth_status'] = this.authStatus;
    data['user_id'] = this.userId;
    data['token'] = this.token;
    return data;
  }
}