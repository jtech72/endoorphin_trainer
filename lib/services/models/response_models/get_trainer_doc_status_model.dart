class GetTrainerDocStatusModel {
  String? message;
  List<Result>? result;
  int? count;
  int? status;

  GetTrainerDocStatusModel(
      {this.message, this.result, this.count, this.status});

  GetTrainerDocStatusModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
    count = json['count'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    data['status'] = status;
    return data;
  }
}

class Result {
  int? id;
  int? userId;
  Null? document;
  Null? status;
  int? categoryId;
  Null? description;
  Null? approveDate;
  Null? rejectDate;
  Null? approveStatus;
  Null? comment;
  Null? remark;
  Null? passportName;
  Null? passportNumber;
  Null? emiratesName;
  Null? emiratesNumber;
  Null? passportfrontImg;
  Null? passportbackImg;
  Null? emiratesfrontImg;
  Null? emiratesbackImg;
  Null? documentForntImg;
  Null? documentBackImg;
  String? createdAt;
  String? updatedAt;
  User? user;
  Category? category;

  Result(
      {this.id,
        this.userId,
        this.document,
        this.status,
        this.categoryId,
        this.description,
        this.approveDate,
        this.rejectDate,
        this.approveStatus,
        this.comment,
        this.remark,
        this.passportName,
        this.passportNumber,
        this.emiratesName,
        this.emiratesNumber,
        this.passportfrontImg,
        this.passportbackImg,
        this.emiratesfrontImg,
        this.emiratesbackImg,
        this.documentForntImg,
        this.documentBackImg,
        this.createdAt,
        this.updatedAt,
        this.user,
        this.category});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    document = json['document'];
    status = json['status'];
    categoryId = json['categoryId'];
    description = json['description'];
    approveDate = json['approveDate'];
    rejectDate = json['rejectDate'];
    approveStatus = json['approveStatus'];
    comment = json['comment'];
    remark = json['remark'];
    passportName = json['passportName'];
    passportNumber = json['passportNumber'];
    emiratesName = json['emiratesName'];
    emiratesNumber = json['emiratesNumber'];
    passportfrontImg = json['passportfrontImg'];
    passportbackImg = json['passportbackImg'];
    emiratesfrontImg = json['emiratesfrontImg'];
    emiratesbackImg = json['emiratesbackImg'];
    documentForntImg = json['documentForntImg'];
    documentBackImg = json['documentBackImg'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['document'] = document;
    data['status'] = status;
    data['categoryId'] = categoryId;
    data['description'] = description;
    data['approveDate'] = approveDate;
    data['rejectDate'] = rejectDate;
    data['approveStatus'] = approveStatus;
    data['comment'] = comment;
    data['remark'] = remark;
    data['passportName'] = passportName;
    data['passportNumber'] = passportNumber;
    data['emiratesName'] = emiratesName;
    data['emiratesNumber'] = emiratesNumber;
    data['passportfrontImg'] = passportfrontImg;
    data['passportbackImg'] = passportbackImg;
    data['emiratesfrontImg'] = emiratesfrontImg;
    data['emiratesbackImg'] = emiratesbackImg;
    data['documentForntImg'] = documentForntImg;
    data['documentBackImg'] = documentBackImg;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (category != null) {
      data['category'] = category!.toJson();
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
  Null? token;
  Null? sessionCode;
  String? gender;
  Null? deviceId;
  Null? profileImg;
  Null? creditAmount;
  Null? activeStatus;
  Null? otp;
  bool? status;
  String? createdAt;
  String? updatedAt;
  Null? roleId;

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
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    roleId = json['roleId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userName'] = userName;
    data['lastName'] = lastName;
    data['password'] = password;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['token'] = token;
    data['sessionCode'] = sessionCode;
    data['gender'] = gender;
    data['deviceId'] = deviceId;
    data['profileImg'] = profileImg;
    data['creditAmount'] = creditAmount;
    data['activeStatus'] = activeStatus;
    data['otp'] = otp;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['roleId'] = roleId;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['image'] = image;
    data['description'] = description;
    data['status'] = status;
    data['logo'] = logo;
    data['durations'] = durations;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
