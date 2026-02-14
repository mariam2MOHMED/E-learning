import 'package:elearning/core/l10n/app_localizations.dart';
import 'package:elearning/core/route/app_routes.dart';
import 'package:elearning/core/theme/app_colors.dart';
import 'package:elearning/core/theme/fonts_manager.dart';
import 'package:flutter/material.dart';

class RememberMeSection extends StatelessWidget {
   const RememberMeSection({super.key,
     required this.value,
     this.onChanged});
final bool value;final void Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
         Row(
           children: [
             Checkbox(
                 activeColor: AppColors.blue,
                 mouseCursor: MouseCursor.defer,
                 checkColor: Colors.white,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(0.0),
                 ),


                 side: const BorderSide(
                   color:  AppColors.blue,
                   width: 1.5,
                 ),

                 value: value, onChanged: onChanged),
             const SizedBox(width: 10.0,),
Text(AppLocalizations.of(context)!.remeberMe ,
  style: Theme.of(context).textTheme.headlineSmall,)
           ],
         )
          ],
        ),
      GestureDetector(
        onTap: (){
          Navigator.of(context).pushNamed(AppRoutes.forgetPassword);
        },
        child:   Text(AppLocalizations.of(context)!.forgotPassword ,
        style: const TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeightManager.medium,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.black,
          color: AppColors.black,
          decorationThickness: 2,

        ),
      ),)
      ],
    );
  }
}
