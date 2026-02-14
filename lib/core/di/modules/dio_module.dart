import "package:dio/dio.dart";
import "package:elearning/core/di/di.dart";
import "package:injectable/injectable.dart";
import "package:pretty_dio_logger/pretty_dio_logger.dart";

import "../../interceptor/token_interceptor.dart";
@module
abstract class DioModule {
  @lazySingleton
  Dio provideDio() {
    final dio = Dio();
    dio.options.headers = {};
    dio.interceptors.add(getIt<PrettyDioLogger>());
    dio.interceptors.add(getIt.get<TokenInterceptor>());
    return dio;
  }
  @lazySingleton
PrettyDioLogger get prettyDioLogger=>PrettyDioLogger(
  requestHeader: true,
  requestBody: true,
  responseBody: true,
  responseHeader: true
);

}
