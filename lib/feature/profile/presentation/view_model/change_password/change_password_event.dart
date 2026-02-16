sealed class ChangePasswordIntent{
  const ChangePasswordIntent();
}
final class  ChangePasswordInitializationIntent extends ChangePasswordIntent{
  const ChangePasswordInitializationIntent();
}
final class  ChangePasswordFormIntent extends ChangePasswordIntent{
  const ChangePasswordFormIntent();
}
final class   IsTypingPasswordIntent extends ChangePasswordIntent{
  const IsTypingPasswordIntent();
}