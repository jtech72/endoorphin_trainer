class GetTrainerAllData {
  int? walletAmount;
  int? totalSession;
  int? upcomingBookingCount;
  int? status;

  GetTrainerAllData(
      {this.walletAmount,
        this.totalSession,
        this.upcomingBookingCount,
        this.status});

  GetTrainerAllData.fromJson(Map<String, dynamic> json) {
    walletAmount = json['walletAmount'];
    totalSession = json['totalSession'];
    upcomingBookingCount = json['upcomingBookingCount'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['walletAmount'] = walletAmount;
    data['totalSession'] = totalSession;
    data['upcomingBookingCount'] = upcomingBookingCount;
    data['status'] = status;
    return data;
  }
}
