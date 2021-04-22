class ErrorModel {
  List<String> errors;

  ErrorModel(
    this.errors,
  );

  static ErrorModel fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      json['errors'].cast<String>(),
    );
  }
}
