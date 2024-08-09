class GetBookingHistoryModel {
  String? message;
  List<Result>? result;
  int? status;

  GetBookingHistoryModel({this.message, this.result, this.status});

  GetBookingHistoryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Result {
  int? id;
  int? userId;
  int? trainerId;
  Null? packageName;
  int? bookingAmount;
  String? categoryName;
  int? sessionTime;
  String? startSession;
  String? endSession;
  Null? totalTimePeriod;
  String? bookingStatus;
  Null? bookingRemark;
  String? bookingType;
  Null? bookingCancellationReason;
  int? sessionPin;
  int? orderId;
  Null? paymentDetails;
  int? createOrderId;
  String? trainerName;
  String? userName;
  bool? trainerOnTheWay;
  Null? scheduleDate;
  String? scheduletime;
  Null? paymentType;
  int? categoryId;
  bool? pinStatus;
  String? createdAt;
  String? updatedAt;

  Result(
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
        this.createdAt,
        this.updatedAt});

  Result.fromJson(Map<String, dynamic> json) {
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
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
