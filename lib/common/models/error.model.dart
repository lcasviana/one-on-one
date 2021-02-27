class ErrorModel {
  List<String> errors;

  ErrorModel({this.errors});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    errors = json['errors'].cast<String>();
  }
}
