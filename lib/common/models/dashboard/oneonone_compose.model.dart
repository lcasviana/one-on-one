import 'package:oneonones/common/models/oneonone/oneonone.model.dart';
import 'package:oneonones/common/models/historical/historical.model.dart';
import 'package:oneonones/common/models/dashboard/status.model.dart';

class OneononeComposeModel {
  OneononeModel oneonone;
  List<HistoricalModel> historical;
  StatusModel status;

  OneononeComposeModel(
    this.oneonone,
    this.historical,
    this.status,
  );

  static OneononeComposeModel fromJson(Map<String, dynamic> json) {
    return OneononeComposeModel(
      OneononeModel.fromJson(json['oneonone']),
      List<HistoricalModel>.from(json['historical'].map((h) => HistoricalModel.fromJson(h))),
      StatusModel.fromJson(json['status']),
    );
  }
}
