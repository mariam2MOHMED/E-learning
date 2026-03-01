import 'package:elearning/feature/explore/domain/entity/exam_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/l10n/app_localizations.dart';
import '../../../../../../core/theme/app_colors.dart';
class ExamDescriptionWidget extends StatelessWidget {
  const ExamDescriptionWidget({super.key, required this.examEntity});
final ExamEntity examEntity;
  @override
  Widget build(BuildContext context) {
    return  Padding(padding:const EdgeInsetsDirectional.symmetric(horizontal: 16.0),
      child:      Column(
        children: [
          Row(

            children: [
              Image.asset("assets/images/Profit.png", width: 60.0, height: 80.0,
                  fit: BoxFit.cover),
              const SizedBox(width: 8.0,),
              Text(examEntity.title,style: Theme.of(context).textTheme.titleLarge,),
              const  Spacer(),
              Text("${examEntity.duration} ${AppLocalizations.of(context)!.minutes}"
                ,style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.blue
                ),),
            ],
          ),
          const SizedBox(height: 16.0,),
          Row(
            children: [
              Text(examEntity.active?AppLocalizations.of(context)!.high_level:
              AppLocalizations.of(context)!.low_level,style: Theme.of(context).textTheme.titleLarge,),
              Padding(padding:    const EdgeInsetsDirectional.symmetric(
                  horizontal: 8.0
              ), child: Container(
                height: 21.0,
                width: 1.0,
                color: AppColors.primaryBlue[200],
              ),),
              Text("${examEntity.numberOfQuestions} ${AppLocalizations.of(context)!.questions}"
                ,style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.gray
                ),),
            ],
          )
        ],
      ),

    );
  }
}
