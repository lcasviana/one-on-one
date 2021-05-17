class EmployeeModel {
  String id;
  String email;
  String name;

  EmployeeModel(
    this.id,
    this.email,
    this.name,
  );

  static EmployeeModel fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      json['id'],
      json['email'],
      json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
    };
  }
}
