import 'package:elearning/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class HaveAccountSection extends StatelessWidget {
  const  HaveAccountSection({super.key, required this.title, required this.subTitle,
     required this.onEnter});
final String title;final String subTitle;
   final VoidCallback onEnter;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(text: TextSpan(
          children: [
            TextSpan(
              text: title,
              style:Theme.of(context).textTheme.displayMedium
            ),

            TextSpan(

         recognizer: TapGestureRecognizer()
                  ..onTap = onEnter,
                text: subTitle,
                style:Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: AppColors.blue,
                    decoration: TextDecoration.underline
                )
            )
          ]
        ))
      ],
    );
  }
}
