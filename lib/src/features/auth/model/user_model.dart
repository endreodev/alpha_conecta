class UserModel {
  String? name;
  String? password;

  UserModel({this.name, this.password});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['password'] = password;
    return data;
  }
}
