class GetWalletAmountModel {
  int? result;
  int? status;

  GetWalletAmountModel({this.result, this.status});

  GetWalletAmountModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['status'] = status;
    return data;
  }
}
