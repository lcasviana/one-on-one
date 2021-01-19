class EmployeeModel {
  String name;
  String email;

  EmployeeModel({
    this.name,
    this.email,
  });

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
  }
}
