class OneononeStatusModel {
  DateTime lastOccurrence;
  DateTime nextOccurrence;
  bool isLate;

  OneononeStatusModel({
    this.lastOccurrence,
    this.nextOccurrence,
    this.isLate,
  });

  OneononeStatusModel.fromJson(Map<String, dynamic> json) {
    this.lastOccurrence = DateTime.parse(json['lastOccurrence']);
    this.nextOccurrence = DateTime.parse(json['nextOccurrence']);
    this.isLate = json['isLate'];
  }
}
