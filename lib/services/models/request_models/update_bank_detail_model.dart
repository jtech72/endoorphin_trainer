class UpdateBankDetailModel {
  String? message;
  dynamic? status;

  UpdateBankDetailModel({this.message, this.status});

  UpdateBankDetailModel.fromJson(Map<dynamic, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

