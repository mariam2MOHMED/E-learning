import 'package:dio/dio.dart';
import 'package:elearning/core/constants/constants.dart';
import 'package:injectable/injectable.dart';

import '../cache/secure_storage_helper.dart';

@lazySingleton
class TokenInterceptor extends Interceptor {
  final SecureStorage _secure;

  TokenInterceptor(this._secure);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _secure.getData(key: Constants.token);
    options.headers["token"] = token;
    super.onRequest(options, handler);
  }
}
