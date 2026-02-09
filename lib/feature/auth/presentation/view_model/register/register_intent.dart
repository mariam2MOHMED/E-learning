sealed class RegisterIntent {
  const RegisterIntent();
}
final class RegisterInitializationIntent extends RegisterIntent {
  const RegisterInitializationIntent();
}
final class RegisterFormIntent extends RegisterIntent {
  const RegisterFormIntent();
}
final class ValidateBasicInfoIntent extends RegisterIntent {
  const ValidateBasicInfoIntent();
}
final class IsTypingIntent extends RegisterIntent {
  const IsTypingIntent();
}