class UserModel {
  String _id;
  String username;
  String password;
  String rePassword;

  UserModel([
    this._id,
    this.username,
    this.password,
    this.rePassword
  ]);

  Map<String, dynamic> userToJson() {
    return {
      'username': username,
      'password': password,
    };
  }

    UserModel.userFromJson(Map json) {
      _id = json['_id'];
      username = json['username'];
      password = json['password'];
  }

}
