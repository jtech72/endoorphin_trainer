class SessionBookingDetailModel {
  Result? result;
  int? status;

  SessionBookingDetailModel({this.result, this.status});

  SessionBookingDetailModel.fromJson(Map<String, dynamic> json) {
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
  String? trainerName;
  String? trainerBio;
  String? customerName;
  String? customerPhoneNumber;
  String? customerEmail;
  String? customerProfileImg;
  String? trainerProfileImg;
  String? bookingDate;
  int? duration;
  dynamic startSession;
  dynamic endSession;
  dynamic scheduletime;
  String? bookingStatus;
  String? customerAddress;
  String? customerCity;
  String? trainerAddress;
  String? trainerCity;
  int? trainerId;
  int? userId;
  int? bookingId;
  int? sessionCount;
  double? trainerReviewCount;
  String? trainerEmail;
  String? trainerContactNumber;
  double? userReviewCount;

  Result(
      {this.categoryName,
        this.trainerName,
        this.trainerBio,
        this.customerName,
        this.customerPhoneNumber,
        this.customerEmail,
        this.customerProfileImg,
        this.trainerProfileImg,
        this.bookingDate,
        this.duration,
        this.startSession,
        this.endSession,
        this.scheduletime,
        this.bookingStatus,
        this.customerAddress,
        this.customerCity,
        this.trainerAddress,
        this.trainerCity,
        this.trainerId,
        this.userId,
        this.bookingId,
        this.sessionCount,
        this.trainerReviewCount,
        this.trainerEmail,
        this.trainerContactNumber,
        this.userReviewCount});

  Result.fromJson(Map<String, dynamic> json) {
    categoryName = json['categoryName'];
    trainerName = json['trainerName'];
    trainerBio = json['trainerBio'];
    customerName = json['customerName'];
    customerPhoneNumber = json['customerPhoneNumber'];
    customerEmail = json['customerEmail'];
    customerProfileImg = json['customerProfileImg'];
    trainerProfileImg = json['trainerProfileImg'];
    bookingDate = json['bookingDate'];
    duration = json['duration'];
    startSession = json['startSession'];
    endSession = json['endSession'];
    scheduletime = json['scheduletime'];
    bookingStatus = json['bookingStatus'];
    customerAddress = json['customerAddress'];
    customerCity = json['customerCity'];
    trainerAddress = json['trainerAddress'];
    trainerCity = json['trainerCity'];
    trainerId = json['trainerId'];
    userId = json['userId'];
    bookingId = json['bookingId'];
    sessionCount = json['sessionCount'];
    trainerReviewCount = json['trainerReviewCount'];
    trainerEmail = json['trainerEmail'];
    trainerContactNumber = json['trainerContactNumber'];
    userReviewCount = json['userReviewCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryName'] = this.categoryName;
    data['trainerName'] = this.trainerName;
    data['trainerBio'] = this.trainerBio;
    data['customerName'] = this.customerName;
    data['customerPhoneNumber'] = this.customerPhoneNumber;
    data['customerEmail'] = this.customerEmail;
    data['customerProfileImg'] = this.customerProfileImg;
    data['trainerProfileImg'] = this.trainerProfileImg;
    data['bookingDate'] = this.bookingDate;
    data['duration'] = this.duration;
    data['startSession'] = this.startSession;
    data['endSession'] = this.endSession;
    data['scheduletime'] = this.scheduletime;
    data['bookingStatus'] = this.bookingStatus;
    data['customerAddress'] = this.customerAddress;
    data['customerCity'] = this.customerCity;
    data['trainerAddress'] = this.trainerAddress;
    data['trainerCity'] = this.trainerCity;
    data['trainerId'] = this.trainerId;
    data['userId'] = this.userId;
    data['bookingId'] = this.bookingId;
    data['sessionCount'] = this.sessionCount;
    data['trainerReviewCount'] = this.trainerReviewCount;
    data['trainerEmail'] = this.trainerEmail;
    data['trainerContactNumber'] = this.trainerContactNumber;
    data['userReviewCount'] = this.userReviewCount;
    return data;
  }
}
