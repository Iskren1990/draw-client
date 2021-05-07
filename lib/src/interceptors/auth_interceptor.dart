import 'dart:async';
import 'package:dio/dio.dart';

import '../context/user_context.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<dynamic> onRequest(RequestOptions options) async {
    final token = UserContext().token;

    if (token != null) {
      options.headers.addAll({'authentication': '$token'});

      return options;
    }
  }
}
