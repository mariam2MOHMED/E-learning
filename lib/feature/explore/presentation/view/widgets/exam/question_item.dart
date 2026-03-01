import 'package:elearning/core/theme/app_colors.dart';
import 'package:elearning/feature/explore/domain/entity/question_entity.dart';
import 'package:flutter/material.dart';

class QuestionItem extends StatefulWidget {
  QuestionItem({
    super.key,
    required this.questionEntity,
    this.isSelected = false, required this.index,
  });

  final QuestionEntity questionEntity;
  bool isSelected;
final int index;
  @override
  State<QuestionItem> createState() => _QuestionItemState();
}

class _QuestionItemState extends State<QuestionItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isSelected = !(widget.isSelected);
        });
      },
      child: Container(
        padding: const EdgeInsetsDirectional.symmetric(
          vertical: 17.5,
          horizontal: 20.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(10),
          color: widget.isSelected
              ? AppColors.lightPurple
              : AppColors.lightBlue,
        ),
        child: Row(
          children: [
            Container(
              width: 20.0,
              height: 20.0,

              decoration: BoxDecoration(
                shape: BoxShape.circle,

                border: Border.all(color: AppColors.blue, width: 2),
              ),

              child: Padding(
                padding: const EdgeInsetsDirectional.all(3),
                child: CircleAvatar(
                  backgroundColor: widget.isSelected
                      ? AppColors.blue
                      : AppColors.white,
                ),
              ),
            ),
            const SizedBox(width: 18.0),
       Flexible(child:      Text(
         widget.questionEntity.answers[widget.index].answer,
         maxLines: 2,
         style: Theme.of(context).textTheme.headlineMedium,
       ),)
          ],
        ),
      ),
    );
  }
}
