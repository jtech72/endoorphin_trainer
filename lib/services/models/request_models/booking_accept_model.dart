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
  int? userId;
  String? phoneNumber;
  String? userProfile;
  String? userAddressType;
  String? userHouseNo;
  String? userCity;
  String? userStreetArea;
  double? userLat;
  double? userLong;
  String? trainerddressType;
  String? trainerHouseNo;
  String? trainerCity;
  String? trainerStreetArea;
  double? trainerLat;
  double? trainerLong;
  int? sessionPin;
  int? bookingId;

  Result(
      {
        this.userName,
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
        this.bookingId});

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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['lastName'] = this.lastName;
    data['userId'] = this.userId;
    data['phoneNumber'] = this.phoneNumber;
    data['userProfile'] = this.userProfile;
    data['userAddressType'] = this.userAddressType;
    data['userHouseNo'] = this.userHouseNo;
    data['UserCity'] = this.userCity;
    data['userStreetArea'] = this.userStreetArea;
    data['userLat'] = this.userLat;
    data['userLong'] = this.userLong;
    data['trainerddressType'] = this.trainerddressType;
    data['trainerHouseNo'] = this.trainerHouseNo;
    data['trainerCity'] = this.trainerCity;
    data['trainerStreetArea'] = this.trainerStreetArea;
    data['trainerLat'] = this.trainerLat;
    data['trainerLong'] = this.trainerLong;
    data['sessionPin'] = this.sessionPin;
    data['bookingId'] = this.bookingId;
    return data;
  }
}
