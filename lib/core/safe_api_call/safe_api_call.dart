import 'package:dio/dio.dart';

import '../error/api_error.dart';
import '../error/response_exceptions.dart';
import '../result/result.dart';


Future<Result<T>> safeCall<T>(Future<T> Function() call) async {
  try {
    final response = await call();
    return SuccessResult(response);
  } on Exception catch (error) {
    if (error is DioException) {
      return FailedResult(ServerFailure.fromDioError(error).error);
    } else if (error is ResponseException) {
      return FailedResult(ResponseException(message: error.message).message);
    } else {
      return FailedResult(error.toString());
    }
  } catch (error) {
    return FailedResult(error.toString());
  }
}
