class OneononeHistoricalInputModel {
  String? leaderEmail;
  String? ledEmail;
  DateTime? occurrence;
  String? commentary;

  OneononeHistoricalInputModel({
    this.leaderEmail,
    this.ledEmail,
    this.occurrence,
    this.commentary,
  });

  Map<String, dynamic> toJson() {
    return {
      'leaderEmail': leaderEmail,
      'ledEmail': ledEmail,
      'occurrence': occurrence!.toIso8601String().substring(0, 10),
      'commentary': commentary,
    };
  }
}
