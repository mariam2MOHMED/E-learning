sealed class ProfileIntent{
  const ProfileIntent();
}
final class GetLoggedUserInfoEvent extends ProfileIntent{
  const GetLoggedUserInfoEvent();
}
final class EditProfileFormEvent extends ProfileIntent {
  final String username;
  final String firstName;
  final String lastName;
  final String phone;

  const EditProfileFormEvent({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.phone,
  });
}