class GetMonthlyData {
  String? message;
  dynamic status;
  dynamic year;
  dynamic month;
  List<RevenueByDay>? revenueByDay;
  dynamic totalRevenue;
  dynamic totalSession;

  GetMonthlyData(
      {this.message,
        this.status,
        this.year,
        this.month,
        this.revenueByDay,
        this.totalRevenue,
        this.totalSession});

  GetMonthlyData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    year = json['year'];
    month = json['month'];
    if (json['revenueByDay'] != null) {
      revenueByDay = <RevenueByDay>[];
      json['revenueByDay'].forEach((v) {
        revenueByDay!.add(new RevenueByDay.fromJson(v));
      });
    }
    totalRevenue = json['totalRevenue'];
    totalSession = json['totalSession'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['year'] = this.year;
    data['month'] = this.month;
    if (this.revenueByDay != null) {
      data['revenueByDay'] = this.revenueByDay!.map((v) => v.toJson()).toList();
    }
    data['totalRevenue'] = this.totalRevenue;
    data['totalSession'] = this.totalSession;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['revenue'] = this.revenue;
    return data;
  }
}
