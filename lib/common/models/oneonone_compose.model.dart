import 'package:oneonones/common/models/oneonone.model.dart';
import 'package:oneonones/common/models/oneonone_historical.model.dart';
import 'package:oneonones/common/models/oneonone_status.model.dart';

class OneononeComposeModel {
  OneononeModel oneonone;
  List<OneononeHistoricalModel> historical;
  OneononeStatusModel status;

  OneononeComposeModel({
    this.oneonone,
    this.historical,
    this.status,
  });

  OneononeComposeModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    oneonone = OneononeModel.fromJson(json['oneonone']);
    historical = List<OneononeHistoricalModel>.from(json['historical'].map((j) => OneononeHistoricalModel.fromJson(j)));
    status = OneononeStatusModel.fromJson(json['status']);
  }
}
