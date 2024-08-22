class BookingAcceptDetailsModel {
  Result? result;
  int? status;
  String? message;


  BookingAcceptDetailsModel({this.result, this.status,this.message});

  BookingAcceptDetailsModel.fromJson(Map<dynamic, dynamic> json) {
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
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
  String? userCity;
  dynamic userLat;
  dynamic userLong;
  String? trainerddressType;
  String? trainerCity;
  dynamic trainerLat;
  dynamic trainerLong;
  dynamic sessionPin;
  dynamic bookingId;
  String? bookingType;
  dynamic averageReview;

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
        this.averageReview});

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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['lastName'] = this.lastName;
    data['userId'] = this.userId;
    data['phoneNumber'] = this.phoneNumber;
    data['userProfile'] = this.userProfile;
    data['userAddressType'] = this.userAddressType;
    data['UserCity'] = this.userCity;
    data['userLat'] = this.userLat;
    data['userLong'] = this.userLong;
    data['trainerddressType'] = this.trainerddressType;
    data['trainerCity'] = this.trainerCity;
    data['trainerLat'] = this.trainerLat;
    data['trainerLong'] = this.trainerLong;
    data['sessionPin'] = this.sessionPin;
    data['bookingId'] = this.bookingId;
    data['bookingType'] = this.bookingType;
    data['averageReview'] = this.averageReview;
    return data;
  }
}
