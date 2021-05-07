import 'dart:async';

import 'package:angular/angular.dart';
import 'package:dio/dio.dart';
import 'package:angular_router/angular_router.dart';
import '../interceptors/auth_interceptor.dart';

import '../models/user_model.dart';
import '../context/user_context.dart';

@Injectable()
class UserService {

  // stream attempt
  //https://pub.dev/documentation/angular_components/latest/utils_async_async/utils_async_async-library.html
  final StreamController<int> _userUpdated = StreamController.broadcast();
  Stream<int> get userUpdated => _userUpdated.stream;

  final Router _router;
  final Dio _dio = Dio(BaseOptions(
    contentType: 'application/json',
    baseUrl: 'http://localhost:3000/api',
  ));

  UserService(this._router) {
    _dio.interceptors.add(AuthInterceptor());
  }

  void postLogin(UserModel payload) async {

    try {

    final res = await _dio.post('/user/login',
      data: payload.userToJson());

    if (!res.data['token'].startsWith('Bearer ')) throw Exception(res.data);

    UserContext.setUserData(res.data);
    await _router.navigateByUrl('/', reload: true);

    _userUpdated.add(1);
      
    } catch (e) {
      print(e);
    }
  }

  void postRegister(UserModel payload) async {
    try {
      final res = await _dio.post('/user/register', 
          data: payload.userToJson());

      if (!res.data.toString().contains('_id')) throw Exception(res.data);
      postLogin(payload);

    } catch (e) {
      print(e);
    }
  }

  void getLogout() async {
    try {
      await _router.navigate('/user/login');
      await _dio.get('/user/logout');
      UserContext.deleteUserData();

      _userUpdated.add(2);
    } catch (e) {
      print(e);
    }
  }
}
