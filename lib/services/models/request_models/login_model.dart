class LoginModel {
  Result? result;
  String? message;
  int? status;

  LoginModel({this.result, this.message, this.status});

  LoginModel.fromJson(Map<dynamic, dynamic> json) {
    result =
    json['result'] != null ? Result.fromJson(json['result']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Result {
  int? id;
  String? userName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? password;
  String? accessToken;
  bool? dataExist;
  bool? objectData;

  Result(
      {this.id,
        this.userName,
        this.lastName,
        this.email,
        this.phoneNumber,
        this.password,
        this.accessToken,
        this.dataExist,
        this.objectData});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    lastName = json['lastName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    accessToken = json['accessToken'];
    dataExist = json['dataExist'];
    objectData = json['objectData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userName'] = userName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['password'] = password;
    data['accessToken'] = accessToken;
    data['dataExist'] = dataExist;
    data['objectData'] = objectData;
    return data;
  }
}
