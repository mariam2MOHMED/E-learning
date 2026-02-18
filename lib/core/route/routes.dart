import 'package:elearning/core/app_language/app_language.dart';
import 'package:elearning/core/di/di.dart';
import 'package:elearning/feature/auth/presentation/view/screens/forget_password_screen.dart';
import 'package:elearning/feature/auth/presentation/view/screens/login_screen.dart';
import 'package:elearning/feature/auth/presentation/view/screens/register_screen.dart';
import 'package:elearning/feature/auth/presentation/view/screens/reset_password_screen.dart';
import 'package:elearning/feature/explore/presentation/view/widgets/home_screen.dart';
import 'package:elearning/feature/profile/presentation/view/screens/change_password.dart';
import 'package:flutter/material.dart';
import '../../feature/auth/presentation/view/screens/verfiy_code_screen.dart';
import '../../feature/explore/presentation/view/screens/exam_by_subject/exam_by_subject_screen.dart';
import '../../feature/profile/presentation/view/screens/profile_screen.dart';
import '../l10n/app_localizations.dart';
import 'app_routes.dart';

abstract class Routes{
  static Route generateRoute(RouteSettings setting){
    final url =Uri.parse(setting.name??AppRoutes.noRoute);
    switch(url.path){
      case AppRoutes.register:

        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),

        );
      case AppRoutes.examBySubject:
final subjectId=setting.arguments as String;
        return MaterialPageRoute(
          builder: (_) =>   ExamBySubjectScreen(
            subjectId: subjectId,
          )

        );
      case AppRoutes.home:

        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),

        );
      case AppRoutes.login:

        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),

        );
      case AppRoutes.editProfile:

        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),

        );
      case AppRoutes.changePassword:

        return MaterialPageRoute(
          builder: (_) => const ChangePasswordScreen(),

        );
      case AppRoutes.forgetPassword:

        return MaterialPageRoute(
          builder: (_) => const ForgetPasswordScreen(),

        );
      case AppRoutes.verifyPassword:
//final email=setting.arguments as String;
        return MaterialPageRoute(
          builder: (_) =>   const VerifyCodeScreen(
         //   email: email,
          ),

        );
      case AppRoutes.resetPassword:
  //      final email=setting.arguments as String;
        return MaterialPageRoute(
          builder: (_) =>  const ResetPasswordScreen(
         //   email: email,
          ),

        );
      default :
        return MaterialPageRoute(
         builder: (context)=> Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppLocalizations.of(context)!.noRoutefound),
                ElevatedButton(onPressed: (){
                  if(getIt<AppLanguage>().selectedLocal=="en"){
                    getIt<AppLanguage>().changeLocal("ar");
                  }else{
                    getIt<AppLanguage>().changeLocal("en");
                  }
                }, child: const Text("change Language"))
              ],
            ),
          ), 
         )
        );
    }
  }
}