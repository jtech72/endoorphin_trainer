class GetNotificationDataModel {
  List<Result>? result;
  int? status;

  GetNotificationDataModel({this.result, this.status});

  GetNotificationDataModel.fromJson(Map<String, dynamic> json) {
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
  String? message;
  String? type;
  String? categoryLogo;
  String? createdAt;
  String? updatedAt;

  Result(
      {this.id,
        this.userId,
        this.message,
        this.type,
        this.categoryLogo,
        this.createdAt,
        this.updatedAt});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    message = json['message'];
    type = json['type'];
    categoryLogo = json['categoryLogo'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['message'] = this.message;
    data['type'] = this.type;
    data['categoryLogo'] = this.categoryLogo;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
