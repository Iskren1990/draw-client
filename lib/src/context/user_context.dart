import 'dart:html';

class UserContext {
  static String _id;
  static String _username;
  static String _token;

  static void setUserData(userData) {
    window.localStorage['uid'] = userData['token'];
    _token = userData['token'];
    window.localStorage['id'] = userData['_id'];
    _id = userData['_id'];
    window.localStorage['username'] = userData['username'];
    _username = userData['username'];
  }

  static Object getUserData() {
    if (_token == null) {
      _token =  window.localStorage['uid'];
      _id = window.localStorage['id'];
      _username = window.localStorage['username'];
    }
    return {
      'id': _id,
      'username': _username,
    };
  }

  static void deleteUserData() {
    _token = null;
    _id = null;
    _username = null;
    window.localStorage.remove('id');
    window.localStorage.remove('username');
    window.localStorage.remove('uid');
  }

  String get token {
    return _token ??= window.localStorage['uid'];
  }

    String get id {
    return _id ??= window.localStorage['id'];
  }

    String get username {
    return _username ??= window.localStorage['username'];
  }
}
