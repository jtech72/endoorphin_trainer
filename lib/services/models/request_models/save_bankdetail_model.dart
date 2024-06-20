class SavebankDetailModel {
  String? message;
  int? status;

  SavebankDetailModel({this.message, this.status});

  SavebankDetailModel.fromJson(Map<dynamic, dynamic> json) {
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
