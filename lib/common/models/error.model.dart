class ErrorModel {
  List<String>? errors;

  ErrorModel({this.errors});

  ErrorModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    errors = json['errors'].cast<String>();
  }
}
