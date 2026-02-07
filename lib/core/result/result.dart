sealed class Result<T>{}
class SuccessResult<T> extends Result<T>{
  T successResult;
  SuccessResult(this.successResult);
}

class FailedResult<T> extends Result<T>{
 String error;
 FailedResult(this.error);
}