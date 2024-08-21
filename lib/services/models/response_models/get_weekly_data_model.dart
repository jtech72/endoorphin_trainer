class GetWeeklyDataModel {
  String? startDate;
  String? endDate;
  List<DailyRevenue>? dailyRevenue;
  dynamic totalRevenue;
  dynamic totalSession;
  String? message;
  int? status;

  GetWeeklyDataModel(
      {this.startDate,
        this.endDate,
        this.dailyRevenue,
        this.totalRevenue,
        this.totalSession,
        this.message,
        this.status});

  GetWeeklyDataModel.fromJson(Map<String, dynamic> json) {
    startDate = json['startDate'];
    endDate = json['endDate'];
    if (json['dailyRevenue'] != null) {
      dailyRevenue = <DailyRevenue>[];
      json['dailyRevenue'].forEach((v) {
        dailyRevenue!.add(new DailyRevenue.fromJson(v));
      });
    }
    totalRevenue = json['totalRevenue'];
    totalSession = json['totalSession'];
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    if (this.dailyRevenue != null) {
      data['dailyRevenue'] = this.dailyRevenue!.map((v) => v.toJson()).toList();
    }
    data['totalRevenue'] = this.totalRevenue;
    data['totalSession'] = this.totalSession;
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class DailyRevenue {
  String? date;
  String? dayName;
  int? revenue;

  DailyRevenue({this.date, this.dayName, this.revenue});

  DailyRevenue.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    dayName = json['dayName'];
    revenue = json['revenue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['dayName'] = this.dayName;
    data['revenue'] = this.revenue;
    return data;
  }
}
