import 'dart:async';

import 'package:angular/angular.dart';
import 'package:dio/dio.dart';
import 'package:angular_router/angular_router.dart';
import '../interceptors/auth_interceptor.dart';

import '../models/user_model.dart';
import '../context/user_context.dart';

@Injectable()
class UserService {
  static final StreamController<String> _userUpdated =
      StreamController.broadcast(onListen: () => UserService.initValue('_'));

  Stream<String> get userUpdated => _userUpdated.stream;

  final Router _router;
  final Dio _dio = Dio(BaseOptions(
    contentType: 'application/json',
    baseUrl: 'http://localhost:3000/api',
  ));

  UserService(this._router) {
    _dio.interceptors.add(AuthInterceptor());
  }

  static void initValue(e) {
    _userUpdated.add('update-state');
  }

  void postLogin(UserModel payload) async {
    try {
      final res = await _dio.post('/user/login', data: payload.userToJson());

      if (!res.data['token'].startsWith('Bearer ')) throw Exception(res.data);

      UserContext.setUserData(res.data);
      _userUpdated.add('update-state');

      await _router.navigateByUrl('/', reload: true);
    } catch (e) {
      print(e);
    }
  }

  void postRegister(UserModel payload) async {
    try {
      final res = await _dio.post('/user/register', data: payload.userToJson());

      if (!res.data.toString().contains('_id')) throw Exception(res.data);
      postLogin(payload);
    } catch (e) {
      print(e);
    }
  }

  void getLogout() async {
    try {
      await _dio.get('/user/logout');
      UserContext.deleteUserData();
      _userUpdated.add('update-state');
      await _router.navigate('/login');
    } catch (e) {
      print(e);
    }
  }
}
