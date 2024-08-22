class SessionDetailModel {
  Result? result;
  int? status;

  SessionDetailModel({this.result, this.status});

  SessionDetailModel.fromJson(Map<dynamic, dynamic> json) {
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Result {
  String? categoryName;
  String? customerName;
  String? customerEmail;
  String? customerPhoneNumber;
  String? customerProfileImg;
  String? bookingDate;
  int? duration;
  String? startSession;
  String? endSession;

  Result(
      {this.categoryName,
        this.customerName,
        this.customerEmail,
        this.customerPhoneNumber,
        this.customerProfileImg,
        this.bookingDate,
        this.duration,
        this.startSession,
        this.endSession});

  Result.fromJson(Map<String, dynamic> json) {
    categoryName = json['categoryName'];
    customerName = json['customerName'];
    customerEmail = json['customerEmail'];
    customerPhoneNumber = json['customerPhoneNumber'];
    customerProfileImg = json['customerProfileImg'];
    bookingDate = json['bookingDate'];
    duration = json['duration'];
    startSession = json['startSession'];
    endSession = json['endSession'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryName'] = this.categoryName;
    data['customerName'] = this.customerName;
    data['customerEmail'] = this.customerEmail;
    data['customerPhoneNumber'] = this.customerPhoneNumber;
    data['customerProfileImg'] = this.customerProfileImg;
    data['bookingDate'] = this.bookingDate;
    data['duration'] = this.duration;
    data['startSession'] = this.startSession;
    data['endSession'] = this.endSession;
    return data;
  }
}
