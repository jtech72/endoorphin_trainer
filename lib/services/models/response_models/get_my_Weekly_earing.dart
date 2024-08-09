class MyWeeklyEarning {
  CurrentWeek? currentWeek;

  MyWeeklyEarning({this.currentWeek});

  MyWeeklyEarning.fromJson(Map<String, dynamic> json) {
    currentWeek = json['currentWeek'] != null
        ? CurrentWeek.fromJson(json['currentWeek'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (currentWeek != null) {
      data['currentWeek'] = currentWeek!.toJson();
    }
    return data;
  }
}

class CurrentWeek {
  String? startDate;
  String? endDate;
  DailyRevenue? dailyRevenue;
  String? message;
  int? status;

  CurrentWeek(
      {this.startDate, this.endDate, this.dailyRevenue, this.message, this.status});

  CurrentWeek.fromJson(Map<String, dynamic> json) {
    startDate = json['startDate'];
    endDate = json['endDate'];
    dailyRevenue = json['dailyRevenue'] != null
        ? DailyRevenue.fromJson(json['dailyRevenue'])
        : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    if (dailyRevenue != null) {
      data['dailyRevenue'] = dailyRevenue!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class DailyRevenue {
  DayRevenue? day20240804;
  DayRevenue? day20240805;
  DayRevenue? day20240806;
  DayRevenue? day20240807;
  DayRevenue? day20240808;
  DayRevenue? day20240809;
  DayRevenue? day20240810;

  DailyRevenue(
      {this.day20240804,
        this.day20240805,
        this.day20240806,
        this.day20240807,
        this.day20240808,
        this.day20240809,
        this.day20240810});

  DailyRevenue.fromJson(Map<String, dynamic> json) {
    day20240804 = json['2024-08-04'] != null
        ? DayRevenue.fromJson(json['2024-08-04'])
        : null;
    day20240805 = json['2024-08-05'] != null
        ? DayRevenue.fromJson(json['2024-08-05'])
        : null;
    day20240806 = json['2024-08-06'] != null
        ? DayRevenue.fromJson(json['2024-08-06'])
        : null;
    day20240807 = json['2024-08-07'] != null
        ? DayRevenue.fromJson(json['2024-08-07'])
        : null;
    day20240808 = json['2024-08-08'] != null
        ? DayRevenue.fromJson(json['2024-08-08'])
        : null;
    day20240809 = json['2024-08-09'] != null
        ? DayRevenue.fromJson(json['2024-08-09'])
        : null;
    day20240810 = json['2024-08-10'] != null
        ? DayRevenue.fromJson(json['2024-08-10'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (day20240804 != null) {
      data['2024-08-04'] = day20240804!.toJson();
    }
    if (day20240805 != null) {
      data['2024-08-05'] = day20240805!.toJson();
    }
    if (day20240806 != null) {
      data['2024-08-06'] = day20240806!.toJson();
    }
    if (day20240807 != null) {
      data['2024-08-07'] = day20240807!.toJson();
    }
    if (day20240808 != null) {
      data['2024-08-08'] = day20240808!.toJson();
    }
    if (day20240809 != null) {
      data['2024-08-09'] = day20240809!.toJson();
    }
    if (day20240810 != null) {
      data['2024-08-10'] = day20240810!.toJson();
    }
    return data;
  }
}

class DayRevenue {
  String? dayName;
  int? revenue;

  DayRevenue({this.dayName, this.revenue});

  DayRevenue.fromJson(Map<String, dynamic> json) {
    dayName = json['dayName'];
    revenue = json['revenue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dayName'] = dayName;
    data['revenue'] = revenue;
    return data;
  }
}
