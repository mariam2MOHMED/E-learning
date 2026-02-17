import 'package:elearning/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({super.key,
    required this.iconData,
    required this.title,
    required this.index,required this.isSelected, required this.onTap});
final IconData iconData;final String title;
final int index;
final bool isSelected;
  final Function(int) onTap;
  @override
  Widget build(BuildContext context) {

    return
     GestureDetector(
       onTap:()=> onTap(index),
       child:  Column(
         mainAxisSize: MainAxisSize.min,

         children: [
           AnimatedContainer(duration: const Duration(
               milliseconds: 300
           ),
             width: 70.0,
             height: 40,
             decoration: BoxDecoration(
                 color: isSelected?AppColors.primaryBlue[50]:Colors.transparent,

                 borderRadius: BorderRadiusDirectional.circular(20.0)
             ),
             child:
             Icon(iconData,
               size: 24.0,
               color: AppColors.blue,)
           ),

           Text(title,style: Theme.of(context).textTheme.titleSmall,)
         ],
       ),
     );
  }
}
