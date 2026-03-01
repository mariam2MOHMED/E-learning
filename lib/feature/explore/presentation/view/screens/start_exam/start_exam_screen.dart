import 'package:elearning/core/route/app_routes.dart';
import 'package:elearning/feature/explore/domain/entity/exam_entity.dart';
import 'package:elearning/feature/explore/presentation/view/widgets/start_exam/exam_description_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/l10n/app_localizations.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../widgets/start_exam/instructions_exam.dart';

class StartExamScreen extends StatelessWidget {
  const StartExamScreen({super.key,
    required this.examEntity});
final ExamEntity examEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: AppBar(
     leading: IconButton(
       onPressed: () {
         Navigator.of(context).pop();
       },
       icon: const Icon(
         Icons.arrow_back_ios_rounded,
         color: AppColors.gray,
         size: 20.0,
       ),
     ),
   ),
      body:
Column(
  children: [
    ExamDescriptionWidget(examEntity: examEntity),
    Container(
      width: MediaQuery.of(context).size.width,
      height: 1.5,
      color: AppColors.lightPurple,
      margin:const  EdgeInsetsDirectional.symmetric(
        vertical: 16.0
      ),
    ),
    const InstructionsExam(),
    const SizedBox(height: 16.0),
    Padding(padding: const EdgeInsetsDirectional.symmetric(horizontal: 16.0),
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.blue,
            fixedSize: Size(MediaQuery.of(context).size.width, 50)
        ),
        onPressed: (){
Navigator.of(context).pushNamed(AppRoutes.exam,arguments: examEntity);
        }, child: Text(AppLocalizations.of(context)!.start)),)

  ],
)
    );
  }
}
