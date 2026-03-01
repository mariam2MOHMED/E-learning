import 'package:elearning/feature/explore/domain/entity/exam_entity.dart';
import 'package:elearning/feature/explore/presentation/view/widgets/exam_by_subject/exam_item.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
class SubjectDetailsScreen extends StatelessWidget {
  const SubjectDetailsScreen({super.key, required this.examEntity});
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
        title: Text(
          examEntity.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Column(
        children: [
          ExamItem(examEntity: examEntity)
        ],
      ),
    );
  }
}
