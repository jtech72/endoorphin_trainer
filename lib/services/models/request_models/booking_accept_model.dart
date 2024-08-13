class BookingAcceptDetailsModel {
  Result? result;
  int? status;
  String? message;


  BookingAcceptDetailsModel({this.result, this.status});

  BookingAcceptDetailsModel.fromJson(Map<dynamic, dynamic> json) {
    result =
    json['result'] != null ? Result.fromJson(json['result']) : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.toJson();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class Result {
  String? userName;
  String? lastName;
  dynamic userId;
  String? phoneNumber;
  String? userProfile;
  String? userAddressType;
  String? userHouseNo;
  String? userCity;
  String? userStreetArea;
  dynamic userLat;
  dynamic userLong;
  String? trainerddressType;
  String? trainerHouseNo;
  String? trainerCity;
  String? trainerStreetArea;
  dynamic trainerLat;
  dynamic trainerLong;
  int? sessionPin;
  int? bookingId;
  String? bookingType;
  dynamic averageReview;

  Result(
      {this.userName,
        this.lastName,
        this.userId,
        this.phoneNumber,
        this.userProfile,
        this.userAddressType,
        this.userHouseNo,
        this.userCity,
        this.userStreetArea,
        this.userLat,
        this.userLong,
        this.trainerddressType,
        this.trainerHouseNo,
        this.trainerCity,
        this.trainerStreetArea,
        this.trainerLat,
        this.trainerLong,
        this.sessionPin,
        this.bookingId,
        this.bookingType,
        this.averageReview});

  Result.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    lastName = json['lastName'];
    userId = json['userId'];
    phoneNumber = json['phoneNumber'];
    userProfile = json['userProfile'];
    userAddressType = json['userAddressType'];
    userHouseNo = json['userHouseNo'];
    userCity = json['UserCity'];
    userStreetArea = json['userStreetArea'];
    userLat = json['userLat'];
    userLong = json['userLong'];
    trainerddressType = json['trainerddressType'];
    trainerHouseNo = json['trainerHouseNo'];
    trainerCity = json['trainerCity'];
    trainerStreetArea = json['trainerStreetArea'];
    trainerLat = json['trainerLat'];
    trainerLong = json['trainerLong'];
    sessionPin = json['sessionPin'];
    bookingId = json['bookingId'];
    bookingType = json['bookingType'];
    averageReview = json['averageReview'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    data['lastName'] = lastName;
    data['userId'] = userId;
    data['phoneNumber'] = phoneNumber;
    data['userProfile'] = userProfile;
    data['userAddressType'] = userAddressType;
    data['userHouseNo'] = userHouseNo;
    data['UserCity'] = userCity;
    data['userStreetArea'] = userStreetArea;
    data['userLat'] = userLat;
    data['userLong'] = userLong;
    data['trainerddressType'] = trainerddressType;
    data['trainerHouseNo'] = trainerHouseNo;
    data['trainerCity'] = trainerCity;
    data['trainerStreetArea'] = trainerStreetArea;
    data['trainerLat'] = trainerLat;
    data['trainerLong'] = trainerLong;
    data['sessionPin'] = sessionPin;
    data['bookingId'] = bookingId;
    data['bookingType'] = bookingType;
    data['averageReview'] = averageReview;
    return data;
  }
}
