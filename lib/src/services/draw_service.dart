import 'dart:convert';

import 'package:angular/angular.dart';
import 'package:dio/dio.dart';
import 'package:angular_router/angular_router.dart';

import '../interceptors/auth_interceptor.dart';

import 'package:client/src/models/draw_model.dart';
import '../context/user_context.dart';

@Injectable()
class DrawService {
  final Router _router;
  final Dio _dio = Dio(BaseOptions(
    contentType: 'application/json',
    baseUrl: 'http://localhost:3000/api',
  ));

  DrawService(this._router) {
    _dio.interceptors.add(AuthInterceptor());
  }

  void postSaveDrow(DrawModel payload) async {

    await _dio.post('/draw/create',
      data: payload.drowToJson(UserContext().id),
    );

    await _router.navigateByUrl('/');
  }

  Future<List<dynamic>> getUserDrows() async {

    final res = await _dio.get('/draw/user/${UserContext().id}');
    final resDraws = (res.data).map((data) => DrawModel.drawFromJson(data));

    return resDraws.toList();
  }

  Future<DrawModel> getChosenDraw(id) async {

    final res = await _dio.get('/draw/view/$id');
    final draw = json.decode(res.toString());

    return DrawModel.drawFromJson(draw);
  }

  void deleteChosenDraw(id) async {
    
    // seems like Mogno ORM returns null
    await _dio.delete('/draw/delete/$id');
    await _router.navigateByUrl('/');
  }
}
