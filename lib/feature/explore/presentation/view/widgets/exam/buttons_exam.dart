import 'package:flutter/material.dart';

import '../../../../../../core/l10n/app_localizations.dart';
import '../../../../../../core/theme/app_colors.dart';

class ButtonsExam extends StatelessWidget {
  const ButtonsExam({super.key,
    required this.nextPress, required this.backPress});
final void Function() nextPress;
  final void Function() backPress;

  @override
  Widget build(BuildContext context) {
    return      Row(
      children: [
        Expanded(child:    ElevatedButton(
            style:ElevatedButton.styleFrom(
                backgroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                    side:const  BorderSide(
                        color: AppColors.blue,width: 1.2
                    ),
                    borderRadius: BorderRadius.circular(10)
                )
            ) ,

            onPressed:backPress,
            child: Text(AppLocalizations.of(context)!.back   ,
              style: Theme.of(context).textTheme.labelMedium,))),
        const  SizedBox(width: 16.0,),
        Expanded(child:    ElevatedButton(
            style:ElevatedButton.styleFrom(
                backgroundColor: AppColors.blue,
                shape: RoundedRectangleBorder(
                    side:const  BorderSide(
                        color: AppColors.blue,width: 1.2
                    ),
                    borderRadius: BorderRadius.circular(10)
                )
            ) ,

         onPressed: nextPress,
            child: Text(AppLocalizations.of(context)!.next,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: AppColors.white
              ),
            ))),
      ],
    );
  }
}
