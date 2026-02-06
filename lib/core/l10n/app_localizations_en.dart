// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get onlineExam => 'online Exam';

  @override
  String get noRoutefound => 'No route found';

  @override
  String get required => 'This field is required';

  @override
  String get invalidEmail => 'This email is not valid';

  @override
  String get invalidPassword =>
      'Password must be at least 8 characters and contain letters and numbers';

  @override
  String get passwordNotMatch => 'Passwords do not match';

  @override
  String get invalidUsername => 'Enter valid username';

  @override
  String get numbersOnly => 'Enter numbers only';

  @override
  String get phoneLength => 'Phone number must be 11 digits';
}
