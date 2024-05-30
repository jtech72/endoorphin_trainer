class SignUpModel {
  String? message;
  int? userId;
  int? status;

  SignUpModel({this.message, this.userId, this.status});

  SignUpModel.fromJson(Map<dynamic, dynamic> json) {
    message = json['message'];
    userId = json['userId'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['userId'] = userId;
    data['status'] = status;
    return data;
  }
}
