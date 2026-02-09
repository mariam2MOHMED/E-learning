import 'package:elearning/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, required this.title,
    required this.valueNotifier,
    this.onPressed});
final String title;
final ValueNotifier<bool>valueNotifier;
final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return
      ValueListenableBuilder(valueListenable: valueNotifier,
        builder: (context,_,_){
   return   ElevatedButton(
       style: ElevatedButton.styleFrom(
         foregroundColor: AppColors.white,
         backgroundColor: valueNotifier.value?AppColors.blue:AppColors.lightGrey,
         fixedSize: Size(MediaQuery.of(context).size.width, 50),
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadiusDirectional.circular(100)
         )
       ),
       onPressed: onPressed,
       child: Text(title,style: Theme.of(context).textTheme.headlineMedium,));
    });
  }
}
