import 'package:flutter/material.dart';

class ForgetPasswordHeader extends StatelessWidget {
  const ForgetPasswordHeader({super.key,required this.title,
  required this.subTitle});
final String title;final String subTitle;
  @override
  Widget build(BuildContext context) {
    return
     Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Expanded(child: Column(

           children: [
             Text(title,
               style: Theme.of(context).textTheme.bodyLarge,),
             const SizedBox(height: 16.0,),
             Text(subTitle,
               textAlign: TextAlign.center,

               style: Theme.of(context).textTheme.bodyMedium,),

           ],
         ))
       ],
     ) ;
  }
}
