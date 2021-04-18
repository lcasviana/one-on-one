class StatusModel {
  DateTime? lastOccurrence;
  DateTime? nextOccurrence;
  bool? isLate;

  StatusModel(
    this.lastOccurrence,
    this.nextOccurrence,
    this.isLate,
  );

  static StatusModel fromJson(Map<String, dynamic> json) {
    return StatusModel(
      DateTime.parse(json['lastOccurrence']),
      DateTime.parse(json['nextOccurrence']),
      json['isLate'] == 'true',
    );
  }
}
