class SentOtpModel {
  int? otp;
  int? status;
  String? message;

  SentOtpModel({this.message,this.otp, this.status});

  SentOtpModel.fromJson(Map<dynamic, dynamic> json) {
    message = json['message'];
    otp = json['otp'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['otp'] = otp;
    data['status'] = status;
    return data;
  }
}
