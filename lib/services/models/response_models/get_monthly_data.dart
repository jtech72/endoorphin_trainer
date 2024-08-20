class GetMonthlyData {
  String? message;
  int? status;
  int? year;
  int? month;
  List<RevenueByDay>? revenueByDay;

  GetMonthlyData(
      {this.message, this.status, this.year, this.month, this.revenueByDay});

  GetMonthlyData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    year = json['year'];
    month = json['month'];
    if (json['revenueByDay'] != null) {
      revenueByDay = <RevenueByDay>[];
      json['revenueByDay'].forEach((v) {
        revenueByDay!.add(RevenueByDay.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    data['year'] = year;
    data['month'] = month;
    if (revenueByDay != null) {
      data['revenueByDay'] = revenueByDay!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RevenueByDay {
  String? date;
  int? revenue;

  RevenueByDay({this.date, this.revenue});

  RevenueByDay.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    revenue = json['revenue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['revenue'] = revenue;
    return data;
  }
}
