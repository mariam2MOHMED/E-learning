import 'package:elearning/core/l10n/app_localizations.dart';
import 'package:elearning/core/theme/app_colors.dart';
import 'package:elearning/core/validators/validator.dart';
import 'package:flutter/material.dart';

import '../widget/forget_password_header.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
leading: IconButton(onPressed: (){},
    icon: const Icon(Icons.arrow_back_ios_rounded,
color: AppColors.gray,size: 20.0,)),
          title: Text(AppLocalizations.of(context)!.password,
         style: Theme.of(context).textTheme.titleMedium
          ),
        ),
body:   Padding(padding:const EdgeInsetsDirectional.symmetric(
  horizontal: 16.0,vertical: 32.0
),child:  Column(children: [
 const ForgetPasswordHeader(),
  const SizedBox(height: 32.0,),
  TextFormField(
    validator: Validator.validateEmail,

    decoration: InputDecoration(
      hintText: AppLocalizations.of(context)!.enterEmail,
      labelText: AppLocalizations.of(context)!.email,

    ),
  ),
  const SizedBox(height: 32.0,),
  ElevatedButton(
    style: ElevatedButton.styleFrom(
         backgroundColor: AppColors.blue,
        fixedSize:  Size(MediaQuery.of(context).size.width, 50)
    ),
    onPressed:() {

    },
    child: Text(AppLocalizations.of(context)!.continueWord),
  ),

],)),
      );
  }
}
