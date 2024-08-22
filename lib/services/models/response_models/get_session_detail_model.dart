class SessionBookingDetailModel {
  Result? result;
  int? status;

  SessionBookingDetailModel({this.result, this.status});

  SessionBookingDetailModel.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? Result.fromJson(json['result']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.toJson();
    }
    data['status'] = status;
    return data;
  }
}

class Result {
  String? categoryName;
  String? trainerName;
  String? trainerBio;
  String? customerName;
  String? customerEmail;
  String? customerProfileImg;
  String? trainerProfileImg;
  String? bookingDate;
  dynamic duration;
  String? startSession;
  String? endSession;
  String? scheduletime;
  String? bookingStatus;
  String? customerAddress;
  String? customerCity;
  String? trainerAddress;
  String? trainerCity;
  dynamic trainerId;
  dynamic userId;
  dynamic bookingId;
  dynamic sessionCount;
  dynamic trainerReviewCount;
  String? trainerEmail;
  String? trainerContactNumber;
  dynamic userReviewCount;

  Result(
      {this.categoryName,
        this.trainerName,
        this.trainerBio,
        this.customerName,
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoryName'] = categoryName;
    data['trainerName'] = trainerName;
    data['trainerBio'] = trainerBio;
    data['customerName'] = customerName;
    data['customerEmail'] = customerEmail;
    data['customerProfileImg'] = customerProfileImg;
    data['trainerProfileImg'] = trainerProfileImg;
    data['bookingDate'] = bookingDate;
    data['duration'] = duration;
    data['startSession'] = startSession;
    data['endSession'] = endSession;
    data['scheduletime'] = scheduletime;
    data['bookingStatus'] = bookingStatus;
    data['customerAddress'] = customerAddress;
    data['customerCity'] = customerCity;
    data['trainerAddress'] = trainerAddress;
    data['trainerCity'] = trainerCity;
    data['trainerId'] = trainerId;
    data['userId'] = userId;
    data['bookingId'] = bookingId;
    data['sessionCount'] = sessionCount;
    data['trainerReviewCount'] = trainerReviewCount;
    data['trainerEmail'] = trainerEmail;
    data['trainerContactNumber'] = trainerContactNumber;
    data['userReviewCount'] = userReviewCount;
    return data;
  }
}
