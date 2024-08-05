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
  int? id;
  int? userId;
  int? trainerId;
  Null? packageName;
  int? bookingAmount;
  String? categoryName;
  int? sessionTime;
  Null? startSession;
  Null? endSession;
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
  Null? scheduletime;
  Null? paymentType;
  int? categoryId;
  String? createdAt;
  String? updatedAt;
  Category? category;

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
        this.createdAt,
        this.updatedAt,
        this.category});

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
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
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
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? price;
  String? image;
  String? description;
  bool? status;
  String? logo;
  String? durations;
  String? createdAt;
  String? updatedAt;

  Category(
      {this.id,
        this.name,
        this.price,
        this.image,
        this.description,
        this.status,
        this.logo,
        this.durations,
        this.createdAt,
        this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
    description = json['description'];
    status = json['status'];
    logo = json['logo'];
    durations = json['durations'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['image'] = this.image;
    data['description'] = this.description;
    data['status'] = this.status;
    data['logo'] = this.logo;
    data['durations'] = this.durations;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
