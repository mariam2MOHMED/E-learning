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

  @override
  String get signUp => 'إنشاء حساب';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get username => 'اسم المستخدم';

  @override
  String get enterUsername => 'أدخل اسم المستخدم';

  @override
  String get firstName => 'الاسم الأول';

  @override
  String get enterFirstName => 'أدخل الاسم الأول';

  @override
  String get lastName => 'اسم العائلة';

  @override
  String get enterLastName => 'أدخل اسم العائلة';

  @override
  String get remeberMe => 'ذكرنى';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get enterEmail => 'أدخل بريدك الإلكتروني';

  @override
  String get password => 'كلمة المرور';

  @override
  String get enterPassword => 'أدخل كلمة المرور';

  @override
  String get confirmPassword => 'تأكيد كلمة المرور';

  @override
  String get enterConfirmPassword => 'أدخل تأكيد كلمة المرور';

  @override
  String get dontHaveAccount => 'ليس لديك حساب؟  ';

  @override
  String get phoneNumber => 'رقم الهاتف';

  @override
  String get enterPhoneNumber => 'أدخل رقم الهاتف';

  @override
  String get registerSuccess => 'تم إنشاء الحساب بنجاح';

  @override
  String get loginSuccess => 'تم تسجيل الدخول بنجاح';

  @override
  String get signupButton => 'إنشاء حساب';

  @override
  String get alreadyHaveAccount => 'لديك حساب بالفعل؟';

  @override
  String get forgotPassword => 'Forgot Password';

  @override
  String get forgotPasswordDesc =>
      'Please enter the email associated with your account';

  @override
  String get continueWord => 'متابعة';

  @override
  String get enterEmailSentence =>
      'من فضلك أدخل البريد الإلكتروني /n المرتبط بحسابك';

  @override
  String get emailSentSuccessfully => 'تم إرسال البريد الإلكتروني بنجاح';

  @override
  String get emailVerification => 'تأكيد البريد الإلكتروني';

  @override
  String get enterVerificationCode =>
      'من فضلك أدخل رمز التحقق الذي تم إرساله إلى بريدك الإلكتروني';

  @override
  String get invalidCode => 'رمز غير صحيح';

  @override
  String get didNotReceiveCode => 'لم يصلك الرمز؟';

  @override
  String get resend => 'إعادة الإرسال';

  @override
  String get codeSentSuccessfully => 'تم إرسال الكود بنجاح';

  @override
  String get passwordValidation =>
      'يجب ألا تكون كلمة المرور فارغة، ويجب أن تحتوي على 6 أحرف على الأقل، من بينها حرف كبير ورقم واحد';

  @override
  String get resetPassword => 'إعادة تعيين كلمة المرور';

  @override
  String get newPassword => 'كلمة مرور جديدة';

  @override
  String get passwordResetSuccessfully => 'تم إعادة تعيين كلمة المرور بنجاح';
}
