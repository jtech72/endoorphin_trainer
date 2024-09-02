class GetOngoingDetailsModel {
  Result? result;
  int? status;

  GetOngoingDetailsModel({this.result, this.status});

  GetOngoingDetailsModel.fromJson(Map<String, dynamic> json) {
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
  String? userName;
  String? lastName;
  int? userId;
  String? phoneNumber;
  String? userProfile;
  String? userAddressType;
  String? userCity;
  double? userLat;
  double? userLong;
  String? trainerddressType;
  String? trainerCity;
  double? trainerLat;
  double? trainerLong;
  int? sessionPin;
  int? bookingId;
  String? bookingType;
  dynamic averageReview;
  dynamic categoryLogo;

  Result(
      {this.userName,
        this.lastName,
        this.userId,
        this.phoneNumber,
        this.userProfile,
        this.userAddressType,
        this.userCity,
        this.userLat,
        this.userLong,
        this.trainerddressType,
        this.trainerCity,
        this.trainerLat,
        this.trainerLong,
        this.sessionPin,
        this.bookingId,
        this.bookingType,
        this.averageReview,
        this.categoryLogo
      });

  Result.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    lastName = json['lastName'];
    userId = json['userId'];
    phoneNumber = json['phoneNumber'];
    userProfile = json['userProfile'];
    userAddressType = json['userAddressType'];
    userCity = json['UserCity'];
    userLat = json['userLat'];
    userLong = json['userLong'];
    trainerddressType = json['trainerddressType'];
    trainerCity = json['trainerCity'];
    trainerLat = json['trainerLat'];
    trainerLong = json['trainerLong'];
    sessionPin = json['sessionPin'];
    bookingId = json['bookingId'];
    bookingType = json['bookingType'];
    averageReview = json['averageReview'];
    categoryLogo = json['categoryLogo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    data['lastName'] = lastName;
    data['userId'] = userId;
    data['phoneNumber'] = phoneNumber;
    data['userProfile'] = userProfile;
    data['userAddressType'] = userAddressType;
    data['UserCity'] = userCity;
    data['userLat'] = userLat;
    data['userLong'] = userLong;
    data['trainerddressType'] = trainerddressType;
    data['trainerCity'] = trainerCity;
    data['trainerLat'] = trainerLat;
    data['trainerLong'] = trainerLong;
    data['sessionPin'] = sessionPin;
    data['bookingId'] = bookingId;
    data['bookingType'] = bookingType;
    data['averageReview'] = averageReview;
    data['categoryLogo'] = categoryLogo;
    return data;
  }
}
