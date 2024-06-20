class GetCategoryModel {
  List<Result>? result;
  int? pageNumber;
  int? totalRecords;
  int? totalPages;
  int? status;

  GetCategoryModel(
      {this.result,
        this.pageNumber,
        this.totalRecords,
        this.totalPages,
        this.status});

  GetCategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
    pageNumber = json['pageNumber'];
    totalRecords = json['totalRecords'];
    totalPages = json['totalPages'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    data['pageNumber'] = pageNumber;
    data['totalRecords'] = totalRecords;
    data['totalPages'] = totalPages;
    data['status'] = status;
    return data;
  }
}

class Result {
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
  int? categoryWiseTrainerCount;

  Result(
      {this.id,
        this.name,
        this.price,
        this.image,
        this.description,
        this.status,
        this.logo,
        this.durations,
        this.createdAt,
        this.updatedAt,
        this.categoryWiseTrainerCount});

  Result.fromJson(Map<String, dynamic> json) {
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
    categoryWiseTrainerCount = json['categoryWiseTrainerCount'];
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
    data['categoryWiseTrainerCount'] = categoryWiseTrainerCount;
    return data;
  }
}
