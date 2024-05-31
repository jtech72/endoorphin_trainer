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
  String? userName;
  String? email;
  String? lastName;
  String? password;
  String? phoneNumber;
  String? bio;
  String? gender;
  String? profileImg;

  Result(
      {this.userName,
        this.email,
        this.lastName,
        this.password,
        this.phoneNumber,
        this.bio,
        this.gender,
        this.profileImg});

  Result.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    email = json['email'];
    lastName = json['lastName'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    bio = json['bio'];
    gender = json['gender'];
    profileImg = json['profileImg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    data['email'] = email;
    data['lastName'] = lastName;
    data['password'] = password;
    data['phoneNumber'] = phoneNumber;
    data['bio'] = bio;
    data['gender'] = gender;
    data['profileImg'] = profileImg;
    return data;
  }
}
