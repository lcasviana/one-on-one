class HistoricalInputModel {
  String leaderId;
  String ledId;
  DateTime occurrence;
  String? commentary;

  HistoricalInputModel(
    this.leaderId,
    this.ledId,
    this.occurrence,
    this.commentary,
  );

  Map<String, dynamic> toJson() {
    return {
      'leaderId': leaderId,
      'ledId': ledId,
      'occurrence': occurrence.toIso8601String().substring(0, 10),
      'commentary': commentary,
    };
  }
}
