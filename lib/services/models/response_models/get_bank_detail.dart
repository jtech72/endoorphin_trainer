class GetBankDetailModel {
  Result? result;
  String? message;
  int? status;

  GetBankDetailModel({this.result, this.message, this.status});

  GetBankDetailModel.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Result {
  dynamic id;
  String? ifscCode;
  String? bankName;
  String? branchName;
  String? accountName;
  String? banckAccountNumber;
  String? accountType;
  String? effectiveData;
  int? trainerId;
  String? city;
  String? createdAt;
  String? updatedAt;

  Result(
      {this.id,
        this.ifscCode,
        this.bankName,
        this.branchName,
        this.accountName,
        this.banckAccountNumber,
        this.accountType,
        this.effectiveData,
        this.trainerId,
        this.city,
        this.createdAt,
        this.updatedAt});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ifscCode = json['ifscCode'];
    bankName = json['bankName'];
    branchName = json['branchName'];
    accountName = json['accountName'];
    banckAccountNumber = json['banckAccountNumber'];
    accountType = json['accountType'];
    effectiveData = json['effectiveData'];
    trainerId = json['trainerId'];
    city = json['city'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ifscCode'] = this.ifscCode;
    data['bankName'] = this.bankName;
    data['branchName'] = this.branchName;
    data['accountName'] = this.accountName;
    data['banckAccountNumber'] = this.banckAccountNumber;
    data['accountType'] = this.accountType;
    data['effectiveData'] = this.effectiveData;
    data['trainerId'] = this.trainerId;
    data['city'] = this.city;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
