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
        result!.add(Result.fromJson(v));
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
  dynamic? document;
  dynamic? status;
  int? categoryId;
  dynamic? description;
  dynamic? approveDate;
  dynamic? rejectDate;
  dynamic? approveStatus;
  dynamic? comment;
  dynamic? remark;
  dynamic? passport;
  dynamic? passportName;
  dynamic? passportNumber;
  dynamic? emiratesName;
  dynamic? emiratesNumber;
  String? passportfrontImg;
  String? passportbackImg;
  dynamic? emirates;
  String? emiratesfrontImg;
  String? emiratesbackImg;
  dynamic? documentForntImg;
  dynamic? documentFrontImg;
  dynamic? documentBackImg;
  dynamic? categoryName;
  dynamic? categoryNumber;
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
        this.passport,
        this.passportName,
        this.passportNumber,
        this.emiratesName,
        this.emiratesNumber,
        this.passportfrontImg,
        this.passportbackImg,
        this.emirates,
        this.emiratesfrontImg,
        this.emiratesbackImg,
        this.documentForntImg,
        this.documentFrontImg,
        this.documentBackImg,
        this.categoryName,
        this.categoryNumber,
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
    passport = json['passport'];
    passportName = json['passportName'];
    passportNumber = json['passportNumber'];
    emiratesName = json['emiratesName'];
    emiratesNumber = json['emiratesNumber'];
    passportfrontImg = json['passportfrontImg'];
    passportbackImg = json['passportbackImg'];
    emirates = json['emirates'];
    emiratesfrontImg = json['emiratesfrontImg'];
    emiratesbackImg = json['emiratesbackImg'];
    documentForntImg = json['documentForntImg'];
    documentFrontImg = json['documentFrontImg'];
    documentBackImg = json['documentBackImg'];
    categoryName = json['categoryName'];
    categoryNumber = json['categoryNumber'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    category = json['category'] != null
        ? Category.fromJson(json['category'])
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
    data['passport'] = passport;
    data['passportName'] = passportName;
    data['passportNumber'] = passportNumber;
    data['emiratesName'] = emiratesName;
    data['emiratesNumber'] = emiratesNumber;
    data['passportfrontImg'] = passportfrontImg;
    data['passportbackImg'] = passportbackImg;
    data['emirates'] = emirates;
    data['emiratesfrontImg'] = emiratesfrontImg;
    data['emiratesbackImg'] = emiratesbackImg;
    data['documentForntImg'] = documentForntImg;
    data['documentFrontImg'] = documentFrontImg;
    data['documentBackImg'] = documentBackImg;
    data['categoryName'] = categoryName;
    data['categoryNumber'] = categoryNumber;
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
  dynamic? token;
  dynamic? sessionCode;
  String? gender;
  dynamic? deviceId;
  dynamic? profileImg;
  dynamic? creditAmount;
  dynamic? activeStatus;
  dynamic? otp;
  bool? status;
  dynamic? nickName;
  dynamic? professionalTitle;
  dynamic? yearExperience;
  dynamic? areaExpertise;
  dynamic? funFact;
  dynamic? quote;
  dynamic? bio;
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
    data['nickName'] = nickName;
    data['professionalTitle'] = professionalTitle;
    data['yearExperience'] = yearExperience;
    data['areaExpertise'] = areaExpertise;
    data['funFact'] = funFact;
    data['quote'] = quote;
    data['bio'] = bio;
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
