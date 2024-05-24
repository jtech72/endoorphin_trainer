class SentOtpModel {
  int? otp;
  int? status;

  SentOtpModel({this.otp, this.status});

  SentOtpModel.fromJson(Map<dynamic, dynamic> json) {
    otp = json['otp'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['otp'] = otp;
    data['status'] = status;
    return data;
  }
}
