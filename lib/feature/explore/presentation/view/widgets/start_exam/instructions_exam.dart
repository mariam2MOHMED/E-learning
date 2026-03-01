import 'package:elearning/core/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class InstructionsExam extends StatelessWidget {
  const InstructionsExam({super.key});

  @override
  Widget build(BuildContext context) {
    return
     Padding(padding: const EdgeInsetsDirectional.symmetric(
       horizontal: 16.0
     ),child:  Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(AppLocalizations.of(context)!.instructions,
           style: Theme.of(context).textTheme.titleLarge,),
         const SizedBox(height: 16.0,),
         Text(AppLocalizations.of(context)!.select_one_answer,
           style: Theme.of(context).textTheme.headlineMedium,),
         const SizedBox(height: 8.0,),
         Text(AppLocalizations.of(context)!.review_before_submit,
           style: Theme.of(context).textTheme.headlineMedium,),
         const SizedBox(height: 8.0,),
         Text(AppLocalizations.of(context)!.no_cheating,
           style: Theme.of(context).textTheme.headlineMedium,),
         const SizedBox(height: 8.0,),
         Text(AppLocalizations.of(context)!.no_refresh,
           style: Theme.of(context).textTheme.headlineMedium,),
         const SizedBox(height: 8.0,),
       ],
     ),);
  }
}
