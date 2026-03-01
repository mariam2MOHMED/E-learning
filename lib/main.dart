import 'package:elearning/core/constants/constants.dart';
import 'package:elearning/core/route/app_routes.dart';
import 'package:elearning/core/route/routes.dart';
import 'package:elearning/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'core/app_language/app_language.dart';
import 'core/cache/cache_helper.dart';
import 'core/di/di.dart';
import 'core/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();//
  await configureDependencies();
  await SharedPreferencesHelper.init();
  await getIt<AppLanguage>().setSelectedLocal();
  final bool initialRoute =
      SharedPreferencesHelper().getBool(key: Constants.isRemember) ?? false;

  runApp(
  ChangeNotifierProvider.value(
    value: getIt<AppLanguage>(),
      child:  OnlineExamApp(
        initialRoute: initialRoute,
      )));
}


class OnlineExamApp extends StatelessWidget {
  final bool? initialRoute;
  const OnlineExamApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    final appLanguage = Provider.of<AppLanguage>(context);

    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute:
initialRoute != null ? AppRoutes.home:
      AppRoutes.login,

      locale: Locale(appLanguage.selectedLocal),
      onGenerateRoute: Routes.generateRoute,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
