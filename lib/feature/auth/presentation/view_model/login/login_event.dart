sealed class LoginIntent {
  const LoginIntent();
}
final class LoginInitializationIntent extends LoginIntent {
  const LoginInitializationIntent();
}
final class LoginFormIntent extends LoginIntent {
  const LoginFormIntent();
}

final class IsTypingIntent extends LoginIntent {
  const IsTypingIntent();
}