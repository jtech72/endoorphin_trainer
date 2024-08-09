class GetUnpaidBookingModel {
  String? message;
  List<Result>? result;
  int? status;

  GetUnpaidBookingModel({this.message, this.result, this.status});

  GetUnpaidBookingModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Result {
  int? bookingAmount;
  String? createdAt;
  User? user;

  Result({this.bookingAmount, this.createdAt, this.user});

  Result.fromJson(Map<String, dynamic> json) {
    bookingAmount = json['bookingAmount'];
    createdAt = json['createdAt'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bookingAmount'] = this.bookingAmount;
    data['createdAt'] = this.createdAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? userName;
  String? lastName;
  String? password;
  String? email;
  String? phoneNumber;
  String? token;
  Null? sessionCode;
  Null? gender;
  String? deviceId;
  String? profileImg;
  Null? creditAmount;
  Null? activeStatus;
  Null? otp;
  bool? status;
  Null? nickName;
  Null? professionalTitle;
  Null? yearExperience;
  Null? areaExpertise;
  Null? funFact;
  Null? quote;
  Null? bio;
  int? reviewCount;
  int? averageReview;
  String? createdAt;
  String? updatedAt;
  int? roleId;

  User(
      {this.id,
        this.userName,
        this.lastName,
        this.password,
        this.email,
        this.phoneNumber,
        this.token,
        this.sessionCode,
        this.gender,
        this.deviceId,
        this.profileImg,
        this.creditAmount,
        this.activeStatus,
        this.otp,
        this.status,
        this.nickName,
        this.professionalTitle,
        this.yearExperience,
        this.areaExpertise,
        this.funFact,
        this.quote,
        this.bio,
        this.reviewCount,
        this.averageReview,
        this.createdAt,
        this.updatedAt,
        this.roleId});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    lastName = json['lastName'];
    password = json['password'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    token = json['token'];
    sessionCode = json['sessionCode'];
    gender = json['gender'];
    deviceId = json['deviceId'];
    profileImg = json['profileImg'];
    creditAmount = json['creditAmount'];
    activeStatus = json['activeStatus'];
    otp = json['otp'];
    status = json['status'];
    nickName = json['nickName'];
    professionalTitle = json['professionalTitle'];
    yearExperience = json['yearExperience'];
    areaExpertise = json['areaExpertise'];
    funFact = json['funFact'];
    quote = json['quote'];
    bio = json['bio'];
    reviewCount = json['reviewCount'];
    averageReview = json['averageReview'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    roleId = json['roleId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['lastName'] = this.lastName;
    data['password'] = this.password;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['token'] = this.token;
    data['sessionCode'] = this.sessionCode;
    data['gender'] = this.gender;
    data['deviceId'] = this.deviceId;
    data['profileImg'] = this.profileImg;
    data['creditAmount'] = this.creditAmount;
    data['activeStatus'] = this.activeStatus;
    data['otp'] = this.otp;
    data['status'] = this.status;
    data['nickName'] = this.nickName;
    data['professionalTitle'] = this.professionalTitle;
    data['yearExperience'] = this.yearExperience;
    data['areaExpertise'] = this.areaExpertise;
    data['funFact'] = this.funFact;
    data['quote'] = this.quote;
    data['bio'] = this.bio;
    data['reviewCount'] = this.reviewCount;
    data['averageReview'] = this.averageReview;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['roleId'] = this.roleId;
    return data;
  }
}
