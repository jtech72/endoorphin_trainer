class SessionDetailModel {
  Result? result;
  int? status;

  SessionDetailModel({this.result, this.status});

  SessionDetailModel.fromJson(Map<String, dynamic> json) {
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
  String? categoryDescription;
  String? customerName;
  String? customerPhoneNumber;
  String? customerEmail;
  String? customerProfileImg;
  dynamic customerReviewCount;
  dynamic customerAverageReviewCount;
  String? trainerName;
  String? trainerEmail;
  String? trainerProfileImg;
  String? bookingDate;
  dynamic duration;
  String? startSession;
  String? endSession;
  String? scheduletime;
  String? bookingStatus;
  dynamic sessionCount;
  dynamic trainerReviewCount;
  String? trainerBio;

  Result(
      {this.categoryName,
        this.categoryDescription,
        this.customerName,
        this.customerPhoneNumber,
        this.customerEmail,
        this.customerProfileImg,
        this.customerReviewCount,
        this.customerAverageReviewCount,
        this.trainerName,
        this.trainerEmail,
        this.trainerProfileImg,
        this.bookingDate,
        this.duration,
        this.startSession,
        this.endSession,
        this.scheduletime,
        this.bookingStatus,
        this.sessionCount,
        this.trainerReviewCount,
        this.trainerBio});

  Result.fromJson(Map<String, dynamic> json) {
    categoryName = json['categoryName'];
    categoryDescription = json['categoryDescription'];
    customerName = json['customerName'];
    customerPhoneNumber = json['customerPhoneNumber'];
    customerEmail = json['customerEmail'];
    customerProfileImg = json['customerProfileImg'];
    customerReviewCount = json['customerReviewCount'];
    customerAverageReviewCount = json['customerAverageReviewCount'];
    trainerName = json['trainerName'];
    trainerEmail = json['trainerEmail'];
    trainerProfileImg = json['trainerProfileImg'];
    bookingDate = json['bookingDate'];
    duration = json['duration'];
    startSession = json['startSession'];
    endSession = json['endSession'];
    scheduletime = json['scheduletime'];
    bookingStatus = json['bookingStatus'];
    sessionCount = json['sessionCount'];
    trainerReviewCount = json['trainerReviewCount'];
    trainerBio = json['trainerBio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoryName'] = categoryName;
    data['categoryDescription'] = categoryDescription;
    data['customerName'] = customerName;
    data['customerPhoneNumber'] = customerPhoneNumber;
    data['customerEmail'] = customerEmail;
    data['customerProfileImg'] = customerProfileImg;
    data['customerReviewCount'] = customerReviewCount;
    data['customerAverageReviewCount'] = customerAverageReviewCount;
    data['trainerName'] = trainerName;
    data['trainerEmail'] = trainerEmail;
    data['trainerProfileImg'] = trainerProfileImg;
    data['bookingDate'] = bookingDate;
    data['duration'] = duration;
    data['startSession'] = startSession;
    data['endSession'] = endSession;
    data['scheduletime'] = scheduletime;
    data['bookingStatus'] = bookingStatus;
    data['sessionCount'] = sessionCount;
    data['trainerReviewCount'] = trainerReviewCount;
    data['trainerBio'] = trainerBio;
    return data;
  }
}
