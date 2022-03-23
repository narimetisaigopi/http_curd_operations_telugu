class UserModel {
  late int id;
  late String email;

  UserModel({required this.id, required this.email});

  factory UserModel.fromJson(Map map) {
    return UserModel(id: map["id"], email: map["email"]);
  }
}
