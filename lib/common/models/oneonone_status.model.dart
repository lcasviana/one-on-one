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
    if (json == null) return;
    this.lastOccurrence = DateTime.parse(json['lastOccurrence']);
    this.nextOccurrence = DateTime.parse(json['nextOccurrence']);
    this.isLate = json['isLate'] == 'true';
  }
}
