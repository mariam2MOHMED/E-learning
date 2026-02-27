import 'package:elearning/feature/explore/domain/entity/exam_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/theme/app_colors.dart';

class StartExamScreen extends StatelessWidget {
  const StartExamScreen({super.key,
    required this.examEntity});
final ExamEntity examEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: AppBar(
     leading: IconButton(
       onPressed: () {},
       icon: const Icon(
         Icons.arrow_back_ios_rounded,
         color: AppColors.gray,
         size: 20.0,
       ),
     ),
   ),
      body: Column(
        children: [
Row(

  children: [
    Image.asset("assets/images/Profit.png", width: 60.0, height: 80.0,
        fit: BoxFit.cover),
  ],
)
        ],
      ),
    );
  }
}
