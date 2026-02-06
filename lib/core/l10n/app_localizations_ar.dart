// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get onlineExam => 'امتحان أونلاين';

  @override
  String get noRoutefound => 'لا يوجد مسار ';

  @override
  String get required => 'هذا الحقل مطلوب';

  @override
  String get invalidEmail => 'البريد الإلكتروني غير صحيح';

  @override
  String get invalidPassword =>
      'كلمة المرور يجب أن لا تقل عن 8 أحرف وتحتوي على حروف وأرقام';

  @override
  String get passwordNotMatch => 'كلمتا المرور غير متطابقتين';

  @override
  String get invalidUsername => 'اسم المستخدم غير صالح';

  @override
  String get numbersOnly => 'يجب إدخال أرقام فقط';

  @override
  String get phoneLength => 'رقم الهاتف يجب أن يكون 11 رقم';
}
