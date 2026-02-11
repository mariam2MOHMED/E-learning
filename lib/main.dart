import 'package:elearning/core/route/app_routes.dart';
import 'package:elearning/core/route/routes.dart';
import 'package:elearning/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'core/app_language/app_language.dart';
import 'core/di/di.dart';
import 'core/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();//
  await configureDependencies();
  await getIt<AppLanguage>().setSelectedLocal();
  runApp(
  ChangeNotifierProvider.value(
    value: getIt<AppLanguage>(),
      child:  OnlineExamApp()));
}

class OnlineExamApp extends StatelessWidget {
   OnlineExamApp({super.key});
late AppLanguage appLanguage;
  @override
  Widget build(BuildContext context) {
    appLanguage=Provider.of(context);
    return   MaterialApp(
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.login,
      debugShowCheckedModeBanner: false,
      locale: Locale(appLanguage.selectedLocal),
      onGenerateRoute: Routes.generateRoute,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
