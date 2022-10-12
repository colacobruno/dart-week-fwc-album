import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

import '../config/env/env.dart';

class CustomDio extends DioForNative {
  // * DioForNative pq estamos no app

  CustomDio()
      : super(BaseOptions(
          baseUrl: Env.i['backend_base_url'] ?? '',
          connectTimeout: 5000, // 5 sec
          receiveTimeout: 60000, // 60 sec
        )) {
    interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
  }

  CustomDio auth() {
    return this;
  }

  CustomDio unAuth() {
    return this;
  }
}
