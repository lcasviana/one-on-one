class EmployeeInputModel {
  String email;
  String name;

  EmployeeInputModel(
    this.email,
    this.name,
  );

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
    };
  }
}
