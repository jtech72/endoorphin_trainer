class ResetPasswordModel {
  String? message;
  int? status;

  ResetPasswordModel({this.message, this.status});

  ResetPasswordModel.fromJson(Map<dynamic, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}
