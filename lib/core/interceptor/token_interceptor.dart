import 'package:dio/dio.dart';
import 'package:elearning/core/constants/constants.dart';
import 'package:injectable/injectable.dart';

import '../cache/secure_storage_helper.dart';

@lazySingleton
class TokenInterceptor extends Interceptor {
  final SecureStorage _secure;

  TokenInterceptor(this._secure);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _secure.getData(key: Constants.token);

    print("TOKEN = $token");

    if (token != null && token.isNotEmpty) {
      options.headers["token"] = token;
    }

    handler.next(options);
  }

}
