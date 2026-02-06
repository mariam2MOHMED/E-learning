import 'package:elearning/core/app_language/app_language.dart';
import 'package:elearning/core/di/di.dart';
import 'package:flutter/material.dart';


import '../l10n/app_localizations.dart';
import 'app_routes.dart';

abstract class Routes{
  static Route generateRoute(RouteSettings setting){
    final url =Uri.parse(setting.name??AppRoutes.noRoute);
    switch(url.path){
      case AppRoutes.home:
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