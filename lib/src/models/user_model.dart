class UserModel {
  int _id;
  String username;
  String password;
  String rePassword;
  Map<String, Object> draws; // Map<Draws>

  UserModel([
    this.username,
    this.password,
    this.rePassword
  ]);

  Map<String, dynamic> loginToJson() {
    return {
      'username': username,
      'password': password,
    };
  }
  Map<String, dynamic> registerToJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}
