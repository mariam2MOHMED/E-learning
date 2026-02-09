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