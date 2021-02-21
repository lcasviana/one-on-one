class ApiErrorModel {
  List<String> errors;

  ApiErrorModel.fromJson(Map<String, dynamic> json) {
    errors = json['errors'].cast<String>();
  }
}
