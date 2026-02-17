import 'package:elearning/core/l10n/app_localizations.dart';
import 'package:elearning/core/validators/validator.dart';
import 'package:flutter/material.dart';

class ChangePasswordForm extends StatelessWidget {
  const ChangePasswordForm({super.key,
    required this.oldPassword,
    required this.newPassword,
    required this.confrimNewPassword, this.onChanged,
    required this.formkey});
  final TextEditingController oldPassword;
  final TextEditingController newPassword;
  final TextEditingController confrimNewPassword;
  final  void Function(String)? onChanged;
  final GlobalKey<FormState>formkey;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formkey,
        child:
        Column(
        children: [
          TextFormField(
            controller: oldPassword,
            onChanged:onChanged ,
            validator: Validator.validatePassword,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.currentPassword,
              hintText: AppLocalizations.of(context)!.currentPassword,
            ),

          ),
          const   SizedBox(height: 16.0,),
          TextFormField(
            controller: newPassword,
            onChanged:onChanged,

            validator: Validator.validatePassword,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.newPassword,
              hintText: AppLocalizations.of(context)!.newPassword,
            ),

          ),
          const   SizedBox(height: 16.0,),
          TextFormField(
            controller: confrimNewPassword,
            onChanged:onChanged ,
            validator: (_)=>Validator.validateConfirmPassword(confrimNewPassword.text,
                newPassword.text),
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.confirmPassword,
              hintText: AppLocalizations.of(context)!.confirmPassword,
            ),

          ),

        ],
      )
    );
  }
}
