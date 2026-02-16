sealed class ProfileIntent{
  const ProfileIntent();
}
final class GetLoggedUserInfoEvent extends ProfileIntent{
  const GetLoggedUserInfoEvent();
}
final class EditProfileFormEvent extends ProfileIntent {


  const EditProfileFormEvent();
}