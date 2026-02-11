sealed class ForgetPasswordIntent{
  const ForgetPasswordIntent();
}
final class ForgetPasswordInitializationIntent
    extends ForgetPasswordIntent {
  const ForgetPasswordInitializationIntent();
}
final class ForgetPasswordFormIntent
    extends ForgetPasswordIntent {
  const ForgetPasswordFormIntent();
}
final class IsEmailTypedIntent
    extends ForgetPasswordIntent {
  const IsEmailTypedIntent();
}
final class VerifyCodeInitializationIntent
    extends ForgetPasswordIntent {
  const VerifyCodeInitializationIntent();
}
final class VerifyCodeIntent
    extends ForgetPasswordIntent {
  const VerifyCodeIntent();
}
final class ResetPasswordInitializationIntent
    extends ForgetPasswordIntent {
  const ResetPasswordInitializationIntent();
}
final class ResetPasswordFormIntent
    extends ForgetPasswordIntent {
  const ResetPasswordFormIntent();
}