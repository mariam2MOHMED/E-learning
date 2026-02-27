import 'package:elearning/core/l10n/app_localizations.dart';
import 'package:elearning/core/route/app_routes.dart';
import 'package:elearning/feature/explore/domain/entity/exam_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/theme/app_colors.dart';

class ExamItem extends StatelessWidget {
  const ExamItem({super.key, required this.examEntity});
final ExamEntity examEntity;
  @override
  Widget build(BuildContext context) {
    return
    GestureDetector(
      onTap: (){
Navigator.of(context).pushNamed(AppRoutes.startExam,arguments: examEntity);
      },
      child:   Card(
        margin: const EdgeInsetsDirectional.symmetric(
            horizontal: 16.0,
            vertical: 24
        ),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.darkWhite, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4,

        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: 24.0,
            vertical: 16.0,
          ),
          child: Row(
            children: [
              Image.asset("assets/images/Profit.png", width: 60.0, height: 80.0,
                  fit: BoxFit.cover),
              const SizedBox(width: 8.0,),
              Expanded(child:    Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(examEntity.active?AppLocalizations.of(context)!.high_level:
                      AppLocalizations.of(context)!.low_level,style: Theme.of(context).textTheme.titleLarge,),

                      Text("${examEntity.duration} ${AppLocalizations.of(context)!.minutes}"
                        ,style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: AppColors.blue
                        ),),
                    ],
                  ),

                  const SizedBox(height: 8.0,),
                  Text("${examEntity.numberOfQuestions} ${AppLocalizations.of(context)!.questions}"
                    ,style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.gray
                    ),),
                ],
              ),)



            ],
          ),
        ),
      ),
    );
  }
}
