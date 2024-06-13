class ProfileDetailsModel {
  String? message;
  Result? result;
  int? status;

  ProfileDetailsModel({this.message, this.result, this.status});

  ProfileDetailsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    result =
    json['result'] != null ? Result.fromJson(json['result']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    data['status'] = status;
    return data;
  }
}

class Result {
  int? id;
  String? userName;
  String? lastName;
  String? password;
  String? email;
  String? phoneNumber;
  String? token;
  dynamic? sessionCode;
  String? gender;
  String? deviceId;
  String? profileImg;
  dynamic? creditAmount;
  dynamic? activeStatus;
  dynamic? otp;
  bool? status;
  String? nickName;
  String? professionalTitle;
  String? yearExperience;
  String? areaExpertise;
  String? funFact;
  String? quote;
  String? bio;
  String? createdAt;
  String? updatedAt;
  int? roleId;

  Result(
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

  Result.fromJson(Map<String, dynamic> json) {
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
