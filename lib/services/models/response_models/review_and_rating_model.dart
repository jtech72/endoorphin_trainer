class ReviewAndRatingModel {
  List<Result>? result;
  int? status;
  String? message;

  ReviewAndRatingModel({this.result, this.status, this.message});

  ReviewAndRatingModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class Result {
  int? id;
  int? reviewCount;
  dynamic userId;
  int? trainerId;
  int? bookingId;
  String? description;
  String? createdAt;
  String? updatedAt;
  Booking? booking;
  List<UserData>? userData;
  dynamic trainerReviewCount;

  Result(
      {this.id,
        this.reviewCount,
        this.userId,
        this.trainerId,
        this.bookingId,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.booking,
        this.userData,
        this.trainerReviewCount});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reviewCount = json['reviewCount'];
    userId = json['userId'];
    trainerId = json['trainerId'];
    bookingId = json['bookingId'];
    description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    booking =
    json['booking'] != null ? new Booking.fromJson(json['booking']) : null;
    if (json['userData'] != null) {
      userData = <UserData>[];
      json['userData'].forEach((v) {
        userData!.add(new UserData.fromJson(v));
      });
    }
    trainerReviewCount = json['trainerReviewCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['reviewCount'] = this.reviewCount;
    data['userId'] = this.userId;
    data['trainerId'] = this.trainerId;
    data['bookingId'] = this.bookingId;
    data['description'] = this.description;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.booking != null) {
      data['booking'] = this.booking!.toJson();
    }
    if (this.userData != null) {
      data['userData'] = this.userData!.map((v) => v.toJson()).toList();
    }
    data['trainerReviewCount'] = this.trainerReviewCount;
    return data;
  }
}

class Booking {
  int? id;
  int? userId;
  int? trainerId;
  dynamic packageName;
  int? bookingAmount;
  String? categoryName;
  int? sessionTime;
  String? startSession;
  String? endSession;
  dynamic totalTimePeriod;
  String? bookingStatus;
  dynamic bookingRemark;
  String? bookingType;
  dynamic bookingCancellationReason;
  int? sessionPin;
  int? orderId;
  dynamic paymentDetails;
  int? createOrderId;
  String? trainerName;
  String? userName;
  bool? trainerOnTheWay;
  dynamic scheduleDate;
  String? scheduletime;
  dynamic paymentType;
  int? categoryId;
  bool? pinStatus;
  dynamic trainerPaymentRequest;
  dynamic paidStatus;
  dynamic paymentAttachment;
  dynamic paymentId;
  String? createdAt;
  String? updatedAt;

  Booking(
      {this.id,
        this.userId,
        this.trainerId,
        this.packageName,
        this.bookingAmount,
        this.categoryName,
        this.sessionTime,
        this.startSession,
        this.endSession,
        this.totalTimePeriod,
        this.bookingStatus,
        this.bookingRemark,
        this.bookingType,
        this.bookingCancellationReason,
        this.sessionPin,
        this.orderId,
        this.paymentDetails,
        this.createOrderId,
        this.trainerName,
        this.userName,
        this.trainerOnTheWay,
        this.scheduleDate,
        this.scheduletime,
        this.paymentType,
        this.categoryId,
        this.pinStatus,
        this.trainerPaymentRequest,
        this.paidStatus,
        this.paymentAttachment,
        this.paymentId,
        this.createdAt,
        this.updatedAt});

  Booking.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    trainerId = json['trainerId'];
    packageName = json['packageName'];
    bookingAmount = json['bookingAmount'];
    categoryName = json['categoryName'];
    sessionTime = json['sessionTime'];
    startSession = json['startSession'];
    endSession = json['endSession'];
    totalTimePeriod = json['totalTimePeriod'];
    bookingStatus = json['bookingStatus'];
    bookingRemark = json['bookingRemark'];
    bookingType = json['bookingType'];
    bookingCancellationReason = json['bookingCancellationReason'];
    sessionPin = json['sessionPin'];
    orderId = json['orderId'];
    paymentDetails = json['paymentDetails'];
    createOrderId = json['createOrderId'];
    trainerName = json['trainerName'];
    userName = json['userName'];
    trainerOnTheWay = json['trainerOnTheWay'];
    scheduleDate = json['scheduleDate'];
    scheduletime = json['scheduletime'];
    paymentType = json['paymentType'];
    categoryId = json['categoryId'];
    pinStatus = json['pinStatus'];
    trainerPaymentRequest = json['trainerPaymentRequest'];
    paidStatus = json['paidStatus'];
    paymentAttachment = json['paymentAttachment'];
    paymentId = json['paymentId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['trainerId'] = this.trainerId;
    data['packageName'] = this.packageName;
    data['bookingAmount'] = this.bookingAmount;
    data['categoryName'] = this.categoryName;
    data['sessionTime'] = this.sessionTime;
    data['startSession'] = this.startSession;
    data['endSession'] = this.endSession;
    data['totalTimePeriod'] = this.totalTimePeriod;
    data['bookingStatus'] = this.bookingStatus;
    data['bookingRemark'] = this.bookingRemark;
    data['bookingType'] = this.bookingType;
    data['bookingCancellationReason'] = this.bookingCancellationReason;
    data['sessionPin'] = this.sessionPin;
    data['orderId'] = this.orderId;
    data['paymentDetails'] = this.paymentDetails;
    data['createOrderId'] = this.createOrderId;
    data['trainerName'] = this.trainerName;
    data['userName'] = this.userName;
    data['trainerOnTheWay'] = this.trainerOnTheWay;
    data['scheduleDate'] = this.scheduleDate;
    data['scheduletime'] = this.scheduletime;
    data['paymentType'] = this.paymentType;
    data['categoryId'] = this.categoryId;
    data['pinStatus'] = this.pinStatus;
    data['trainerPaymentRequest'] = this.trainerPaymentRequest;
    data['paidStatus'] = this.paidStatus;
    data['paymentAttachment'] = this.paymentAttachment;
    data['paymentId'] = this.paymentId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class UserData {
  int? id;
  String? userName;
  String? lastName;
  String? password;
  String? email;
  String? phoneNumber;
  String? token;
  dynamic sessionCode;
  dynamic gender;
  String? deviceId;
  String? profileImg;
  dynamic creditAmount;
  dynamic activeStatus;
  dynamic otp;
  bool? status;
  dynamic nickName;
  dynamic professionalTitle;
  dynamic yearExperience;
  dynamic areaExpertise;
  dynamic funFact;
  dynamic quote;
  dynamic bio;
  dynamic reviewCount;
  dynamic averageReview;
  dynamic sessionCount;
  String? createdAt;
  String? updatedAt;
  int? roleId;

  UserData(
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
        this.sessionCount,
        this.createdAt,
        this.updatedAt,
        this.roleId});

  UserData.fromJson(Map<String, dynamic> json) {
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
    sessionCount = json['sessionCount'];
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
    data['sessionCount'] = this.sessionCount;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['roleId'] = this.roleId;
    return data;
  }
}
