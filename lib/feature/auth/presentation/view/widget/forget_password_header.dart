import 'package:elearning/core/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ForgetPasswordHeader extends StatelessWidget {
  const ForgetPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Text(AppLocalizations.of(context)!.forgotPassword,
          style: Theme.of(context).textTheme.bodyLarge,),
        const SizedBox(height: 16.0,),
        Text(AppLocalizations.of(context)!.enterEmailSentence,
          textAlign: TextAlign.center,

          style: Theme.of(context).textTheme.bodyMedium,),

      ],
    );
  }
}
